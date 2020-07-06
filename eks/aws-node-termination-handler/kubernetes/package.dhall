{ ClusterRole =
      ./ClusterRole.dhall sha256:31fb30c3f341219bceaae7f94f27cbe1574dd42551ff30741d880d8fde236888
    ? ./ClusterRole.dhall
, ClusterRoleBinding =
      ./ClusterRoleBinding.dhall sha256:53593a2132ad3068d76f680dc4b57bec7e31390690ee2f3e59e7141c7941601d
    ? ./ClusterRoleBinding.dhall
, Common =
      ./Common.dhall sha256:6bbd77d6327505db48e45122057414126e50228238afe226ea5612f7e78d166c
    ? ./Common.dhall
, DaemonSet =
      ./DaemonSet.dhall sha256:5f935ea73e15362ae3fecea72f6df84a8081343b67714593eaa285441b10ae68
    ? ./DaemonSet.dhall
, ServiceAccount =
      ./ServiceAccount.dhall sha256:d363cb291dcc8ab357edd9262d8e25647b7ffa63913465eb7ecefc67a3ce30bf
    ? ./ServiceAccount.dhall
, ServiceMonitor =
      ./ServiceMonitor.dhall sha256:1012ed0ee6f7ec68d198c7cc2bb49536c0359a7ee849eeecd9312bd3d397c2b7
    ? ./ServiceMonitor.dhall
, PrometheusRules =
      ./PrometheusRules.dhall sha256:76dd0edd598b97710fdd134a2bab380cfc82da8cfb1aff21d29b6f8e512c46fd
    ? ./PrometheusRules.dhall
}
