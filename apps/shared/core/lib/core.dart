library core;

/// [Data]
export 'app/data/model/base_request_model.dart';
export 'app/data/model/car_model.dart';
export 'app/data/model/book_model.dart';
export 'app/data/model/requests/add_car_request_model.dart';

/// [Constants]
export 'app/constants/app_colors.dart';
export 'app/constants/app_images.dart';
export 'app/constants/app_lottie.dart';
export 'app/constants/app_regex.dart';
export 'app/constants/database_constants.dart';

/// [Enums]
export 'app/enums/app_enums.dart';

/// [Errors]
export 'app/errors/generic_failure.dart';

/// [Extensions]
export 'app/extensions/context.dart';
export 'app/extensions/double.dart';
export 'app/extensions/helpers.dart';

/// [Config]
export 'app/services/config/env_config.dart';
export 'app/services/routes/admin_app_router.dart';

/// [Routes]
export 'app/services/routes/app_routes.dart';
export 'app/services/routes/user_app_router.dart';
export 'app/services/theme/admin_app_theme.dart';

/// [Theme]
export 'app/services/theme/user_app_theme.dart';

/// [Manager]
export 'views/manager/app_bloc_observer.dart';

/// [Cubits]
export 'app/manager/add_car_cubit/cubit/add_car_cubit.dart';
export 'app/manager/car_list_cubit/cubit/car_list_cubit.dart';
export 'app/manager/book_list_cubit/booking_list_cubit.dart';
export 'app/manager/make_book_cubit/book_cubit.dart';

/// [Screen]
export 'views/pages/splash_screen.dart';
export 'views/pages/empty_screen.dart';
export 'views/widgets/divider/build_divider.dart';
export 'views/booking_history/screens/admin_booking_history_screen.dart';

/// [Widgets]
export 'views/widgets/buttons/app_button.dart';
export 'views/widgets/buttons/bookmark_button.dart';
export 'views/widgets/buttons/back_button.dart';
export 'views/widgets/buttons/common_close_button.dart';
export 'views/widgets/buttons/shared_button.dart';
export 'views/widgets/divider/app_divider.dart';
export 'views/widgets/divider/or_divider.dart';
export 'views/widgets/text_fields/password_text_field.dart';
export 'views/widgets/text_fields/rounded_text_field.dart';
export 'views/widgets/loading_alert/loading_alert.dart';
export 'views/widgets/elliptical_container.dart';
export 'views/widgets/drop_downs/generic_drop_down_button.dart';
export 'views/widgets/container_shimmer.dart';


/// [Nav-Bar]
 export 'views/nav_bar/test_admin_nav_bar.dart';