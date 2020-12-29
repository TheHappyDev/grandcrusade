import 'services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


/// Static global state. Immutable services that do not care about build context. 
class Global {
  // App Data
  static final String title = 'Fireship';

  // Services
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

    // Data Models
  static final Map models = {
    Deployment: (data) => Deployment.fromMap(data),
    Mission: (data) => Mission.fromMap(data),
    Match: (data) => Match.fromMap(data),
  };

  // Firestore References for Writes
  static final Collection<Deployment> deploymentsRef = Collection<Deployment>(path: 'deployments');
  static final Collection<Mission> missionsRef = Collection<Mission>(path: 'missions');


  
}
