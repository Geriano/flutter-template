import 'package:template/backend/param.dart';

enum PaginationOrderDirection {
  asc,
  desc,
}

const paginationParams = {
  'page': Param(
    required: true,
    type: int,
  ),
  'limit': Param(
    required: true,
    type: int,
  ),
  'search': Param(
    required: false,
    type: String,
  ),
  'order[key]': Param(
    required: true,
    type: String,
  ),
  'order[dir]': Param(
    required: true,
    type: PaginationOrderDirection,
  ),
};