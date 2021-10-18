import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:vacation/bloc/blocs.dart';
import 'package:vacation/pages/widgets/destination_tile.dart';
import 'package:vacation/pages/widgets/facility_item.dart';
import 'package:vacation/pages/widgets/popular_spot.dart';
import 'package:vacation/pages/widgets/recommended_tile.dart';
import 'package:vacation/shared/shared.dart';
import 'package:vacation/services/services.dart';
import 'package:vacation/pages/widgets/widgets.dart';
import 'package:vacation/models/models.dart';
import 'package:vacation/pages/note/screens/note_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';


import 'package:google_fonts/google_fonts.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

part 'splash_page.dart';
part 'get_started_page.dart';
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'search_page.dart';

part 'account_confirmation_page.dart';
part 'wrapper.dart';
part 'menu_page.dart';
part 'main_page.dart';
part 'berita_page.dart';
part 'edit_profile.dart';
part 'detail_page.dart';


part 'konten.dart';
part 'note_page.dart';
part 'detail_berita.dart';
