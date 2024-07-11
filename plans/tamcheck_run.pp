plan tamcheck::tamcheck_run (
  TargetSpec        $targets,
  Optional[String]  $output_dir = '/var/tmp',
  Optional[Boolean] $enable_logs = false,
  Optional[Boolean] $download = false,
) {
  catch_errors() || {
    run_task('tamcheck::pe_server_tuning_status', $targets, output_dir => $output_dir, '_catch_errors' => true)
    run_task('tamcheck::pe_server_platform_details', $targets, output_dir => $output_dir)
    run_task('tamcheck::pe_server_node_detail', $targets, output_dir => $output_dir)
    run_task('tamcheck::data_collect', $targets, output_dir => $output_dir)

  }
}
