plan tamcheck::data_collect (
  TargetSpec        $targets,
  Optional[String]  $output_dir = '/var/tmp',
  Optional[Boolean] $enable_logs = false,
  Optional[Boolean] $download = false,
) {
  catch_errors() || {
    #run_task('tamcheck::collect', $targets, output_dir => $output_dir, enable_logs => $enable_logs, '_catch_errors' => true)
    run_task('tamcheck::pe_server_tuning_status', $targets, output_dir => $output_dir, '_catch_errors' => true)
    run_task('tamcheck::pe_server_platform_details', $targets, output_dir => $output_dir)
    run_task('tamcheck::pe_server_node_detail', $targets, output_dir => $output_dir)
    #$zipresult = run_task('tamcheck::zippedata', $targets, output_dir => $output_dir, download => $download)

    #$zipresult.each |$result| {
      #if $download {
        #$rmessage = $result.message
        #$downresults = download_file($rmessage, 'tamcheck', $targets, '_catch_errors' => true)
        #$downresults.each |$dresult| {
          #if $dresult.ok {
            #$dmessage = $dresult.message
            #out::message($dmessage)
          #} else {
            #out::message(" { status: ${dresult.status}, result: ${dresult.error} } ")
          #}
        #}
      #} else {
        #$rvalue = $result.value
        #out::message($rvalue)
      #}
    #}
  }
}
