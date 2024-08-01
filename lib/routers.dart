import 'package:discuss_it/features/auth/screens/login_screen.dart';
import 'package:discuss_it/features/community/screens/add_mod_screen.dart';
import 'package:discuss_it/features/community/screens/create_community_screen.dart';
import 'package:discuss_it/features/community/screens/edit_community_screen.dart';
import 'package:discuss_it/features/community/screens/mod_tools_screen.dart';
import 'package:discuss_it/features/home/screens/home_screen.dart';
import 'package:discuss_it/features/post/screens/add_post_type_screen.dart';
import 'package:discuss_it/features/post/screens/add_posts_screen.dart';
import 'package:discuss_it/features/post/screens/comments_screen.dart';
import 'package:discuss_it/features/user_profile/screens/edit_profile_screen.dart';
import 'package:discuss_it/features/user_profile/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'features/community/screens/community_screen.dart';

// loggedOut routes
final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

// loggedIn routes
final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/create-community': (_) =>
      const MaterialPage(child: CreateCommunityScreen()),
  '/d/:name': (route) => MaterialPage(
        child: CommunityScreen(
          name: route.pathParameters['name']!,
        ),
      ),
  '/mod-tools/:name': (routeData) => MaterialPage(
        child: ModToolsScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  '/edit-community/:name': (routeData) => MaterialPage(
        child: EditCommunityScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  '/add-mods/:name': (routeData) => MaterialPage(
        child: AddModScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  '/u/:uid': (route) => MaterialPage(
        child: UserProfileScreen(
          uid: route.pathParameters['uid']!,
        ),
      ),
  '/edit-profile/:uid': (route) => MaterialPage(
        child: EditProfileScreen(
          uid: route.pathParameters['uid']!,
        ),
      ),
  '/add-post/:type': (route) => MaterialPage(
        child: AddPostTypeScreen(
          type: route.pathParameters['type']!,
        ),
      ),
  '/post/:postId/comments': (route) => MaterialPage(
        child: CommentsScreen(
          postId: route.pathParameters['postId']!,
        ),
      ),
  '/add-post': (route) => const MaterialPage(
        child: AddPostsScreen(),
      ),
});
