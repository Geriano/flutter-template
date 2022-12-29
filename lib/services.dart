import 'package:template/backend/pagination_param.dart';
import 'package:template/backend/param.dart';
import 'package:template/backend/route.dart';
import 'package:template/backend/service.dart';
import 'package:template/backend/services.dart';

const services = Services(
  scheme: Scheme.http,
  hostname: '192.168.0.102:3333',
  services: {
    'auth': Service(
      routes: {
        'login': Route(
          path: '/login',
        ),
        'register': Route(
          path: '/register',
        ),
        'forgot-password': Route(
          path: '/forgot-password',
        ),
        'logout': Route(
          path: '/logout',
        ),
        'user': Route(
          path: '/user',
        ),
      },
    ),
    'permission': Service(
      prefix: '/superuser/permission',
      routes: {
        'all': Route(
          path: '/',
        ),
        'store': Route(
          path: '/',
        ),
        'update': Route(
          path: '{id}',
          params: {
            'id': Param(
              required: true,
              type: int,
            ),
          },
        ),
        'destroy': Route(
          path: '{id}',
          params: {
            'id': Param(
              required: true,
              type: int,
            )
          },
        ),
      },
    ),
    'role': Service(
      prefix: '/superuser/role',
      routes: {
        'all': Route(
          path: '/',
        ),
        'paginate': Route(
          path: '/paginate',
          params: paginationParams,
        ),
        'store': Route(
          path: '/',
        ),
        'update': Route(
          path: '{id}',
          params: {
            'id': Param(
              required: true,
              type: int,
            ),
          },
        ),
        'destroy': Route(
          path: '{id}',
          params: {
            'id': Param(
              required: true,
              type: int,
            )
          },
        ),
      },
    ),
    'user': Service(
      prefix: '/superuser/user',
      routes: {
        'all': Route(
          path: '/',
        ),
        'paginate': Route(
          path: '/paginate',
          params: paginationParams,
        ),
        'store': Route(
          path: '/',
        ),
        'update': Route(
          path: '{id}',
          params: {
            'id': Param(
              required: true,
              type: int,
            ),
          },
        ),
        'destroy': Route(
          path: '{id}',
          params: {
            'id': Param(
              required: true,
              type: int,
            )
          },
        ),
      },
    ),
  }, 
);