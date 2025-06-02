import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_web/home/domain/entities/ability.dart';
import 'package:portfolio_web/home/domain/entities/home_info.dart';
import 'package:portfolio_web/home/domain/entities/project.dart';
import 'package:portfolio_web/home/domain/entities/user_site.dart';

class HomeRepository{
  static const portfolioCollection = 'web_portfolio';
  static const profileUrlName = 'profile_photo';
  static const abilitiesInfoName = 'abilities_info';
  static const jobInfoName = 'job_info';
  static const cvUrlName = 'cv';
  static const abilitiesName = 'abilities';
  static const projectsName = 'projects';
  static const contactLinksName = 'contact_links';
  static const emailName = 'email';
  static const placeName = 'place';

  static const baseAssetPath = 'assets/drawables/';

  final FirebaseFirestore db;
  HomeRepository({required this.db});

  Future<HomeInfo> loadInfo()async{
    late HomeInfo info;
    await db.collection(portfolioCollection).get().then((snapshot){
      late String profileUrl;
      late List<String> jobInfo;
      late String cvUrl;
      late List<Ability> abilities;
      late List<Project> projects;
      late List<UserSite> sites;
      late String email;
      late String place;
      for(DocumentSnapshot ds in snapshot.docs){
        final data = ds.data()! as Map;
        final name = data['name'];
        if(name == profileUrlName){
          profileUrl = '$baseAssetPath/${data['value']}';
        }else if(name == jobInfoName){
          jobInfo = (data['value'] as String).split('\n');
        }else if(name == cvUrlName){
          cvUrl = data['value'];
        }else if(name == abilitiesName){
          abilities = (data['value'] as List).map<Ability>(
            (a) => _getAbilitys(a)
          ).toList();
        }else if(name == projectsName){
          projects = (data['value'] as List).map<Project>(
            (p){
              final links = <ProjectLink>[];
              final linksMap = p['links'] as Map;
              linksMap.forEach((key, value){
                links.add(ProjectLink(
                  type: key == 'playstore'?
                    ProyectLinkType.playstore:
                    key == 'appstore'?
                    ProyectLinkType.appstore:
                    ProyectLinkType.github,
                  url: value
                ));
              });
              return Project(
                name: p['name'],
                shortDescription: p['short_description'] ?? '',
                longDescription: p['long_description'] ?? '',
                mainImage: '$baseAssetPath${p['main_image']}',
                technologies: (p['technologies'] as List).cast<String>()
                  .map(
                    (tech) => '$baseAssetPath$tech'
                  ).toList(),
                links: links
              );
            }
          ).toList();
        }else if(name == contactLinksName){
          sites = (data['value'] as List).map<UserSite>(
            (s) => UserSite(
              type: s['type'] == 'github'?
                UserLkinkType.github:
                  s['type'] == 'stack_overflow'?
                  UserLkinkType.stackOverflow:
                  UserLkinkType.linkedin,
              url: s['url']
            )
          ).toList();
        }else if(name == emailName){
          email = data['value'];
        }else if(name == placeName){
          place = data['value'];
        }
      }
      info = HomeInfo(
        profileUrl: profileUrl,
        jobInfo: jobInfo,
        cvUrl: cvUrl,
        abilities: abilities,
        projects: projects,
        sites: sites,
        email: email,
        place: place
      );
    });
    return info;
  }

  Ability _getAbilitys(Map<String, dynamic> data){
    final dataType = data['type'];
    return Ability(
      icon: '$baseAssetPath${data['image']}',
      name: data['name'],
      lvl: data['lvl'],
      type: dataType == 'mobile'?
        AbilityType.mobile:
        dataType == 'backend'?
          AbilityType.backend:
          AbilityType.tool
    );
  }
}