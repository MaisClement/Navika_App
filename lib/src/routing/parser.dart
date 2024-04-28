// 🐦 Flutter imports:
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:path_to_regexp/path_to_regexp.dart';

// 🌎 Project imports:
import 'package:navika/src/routing/parsed_route.dart';

/// Used by [TemplateRouteParser] to guard access to routes.
typedef RouteGuard<T> = Future<T> Function(T from);

/// Parses the URI path into a [ParsedRoute].
class TemplateRouteParser extends RouteInformationParser<ParsedRoute> {
	final List<String> _pathTemplates;
	final RouteGuard<ParsedRoute>? guard;
	final ParsedRoute initialRoute;

	TemplateRouteParser({
		/// The list of allowed path templates (['/', '/users/:id'])
		required List<String> allowedPaths,

		/// The initial route
		String initialRoute = '/',

		///	[RouteGuard] used to redirect.
		this.guard,
	})	: initialRoute = ParsedRoute(initialRoute, initialRoute, {}, {}),
				_pathTemplates = [
					...allowedPaths,
				],
				assert(allowedPaths.contains(initialRoute));

	@override
	Future<ParsedRoute> parseRouteInformation(RouteInformation routeInformation) async {
		final path = routeInformation.uri.path;
		final queryParams = Uri.parse(path).queryParameters;
		var parsedRoute = initialRoute;

		for (var pathTemplate in _pathTemplates) {
			final parameters = <String>[];
			var pathRegExp = pathToRegExp(pathTemplate, parameters: parameters);
			if (pathRegExp.hasMatch(path)) {
				final match = pathRegExp.matchAsPrefix(path);
				if (match == null) continue;
				final params = extract(parameters, match);
				parsedRoute = ParsedRoute(path, pathTemplate, params, queryParams);
			}
		}

		// Redirect if a guard is present
		var guard = this.guard;
		if (guard != null) {
			return guard(parsedRoute);
		}

		return parsedRoute;
	}

	@override
	RouteInformation restoreRouteInformation(ParsedRoute configuration) => RouteInformation(uri: Uri.parse(configuration.path));
}
