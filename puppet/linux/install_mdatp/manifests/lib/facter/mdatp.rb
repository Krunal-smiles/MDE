Facter.add(:mdatp, :type => :aggregate) do
  chunk(:deviceid) do
    begin
      edrid = Facter::Core::Execution.execute('/bin/mdatp health --field edr_machine_id | grep -v ATTENTION')
      mdatp = {:deviceid => edrid}
      mdatp
    rescue
    end
  end
  
  chunk(:healthy) do
    begin
      healthy = Facter::Core::Execution.execute('/bin/mdatp health --field healthy | grep -v ATTENTION')
      mdatp = {:healthy => healthy}
      mdatp
    rescue
    end
  end

  chunk(:health_issues) do
    begin
      healthissue = Facter::Core::Execution.execute('/bin/mdatp health --field health_issues | grep -v ATTENTION | tr -d \" | tr -d \[ | tr -d \]')
      mdatp = {:health_issues => healthissue.split(',')}
      mdatp
    rescue
    end
  end

  chunk(:licensed) do
    begin
      licensed = Facter::Core::Execution.execute('/bin/mdatp health --field licensed | grep -v ATTENTION')
      mdatp = {:licensed => licensed}
      mdatp
    rescue
    end
  end

  chunk(:engine_version) do
    begin
      engver = Facter::Core::Execution.execute('/bin/mdatp health --field engine_version | grep -v ATTENTION | tr -d \"')
      mdatp = {:engine_version => engver}
      mdatp
    rescue
    end
  end

  chunk(:product_version) do
    begin
      appver = Facter::Core::Execution.execute('/bin/mdatp health --field app_version | grep -v ATTENTION | tr -d \"')
      mdatp = {:product_version => appver}
      mdatp
    rescue
    end
  end
  chunk(:cloud_enabled) do
    begin
      clud = Facter::Core::Execution.execute('/bin/mdatp health --field cloud_enabled | grep -v ATTENTION')
      mdatp = {:cloud_enabled => clud}
      mdatp
    rescue
    end
  end

  chunk(:passive_mode) do
    begin
      pasv = Facter::Core::Execution.execute('/bin/mdatp health --field passive_mode_enabled | grep -v ATTENTION')
      mdatp = {:passive_mode => pasv}
      mdatp
    rescue
    end
  end

  chunk(:realtime_protection) do
    begin
      realtme = Facter::Core::Execution.execute('/bin/mdatp health --field real_time_protection_enabled | grep -v ATTENTION')
      mdatp = {:realtime_protection => realtme}
      mdatp
    rescue
    end
  end

  chunk(:tamper_protection) do
    begin
      tamper = Facter::Core::Execution.execute('/bin/mdatp health --field tamper_protection | grep -v ATTENTION | tr -d \"')
      mdatp = {:tamper_protection=> tamper}
      mdatp
    rescue
    end
  end

  chunk(:automatic_update) do
    begin
      autoupdate = Facter::Core::Execution.execute('/bin/mdatp health --field automatic_definition_update_enabled | grep -v ATTENTION')
      mdatp = {:automatic_update => autoupdate}
      mdatp
    rescue
    end
  end

  chunk(:sig_version) do
    begin
      sigver = Facter::Core::Execution.execute('/bin/mdatp health --field definitions_version | grep -v ATTENTION | tr -d \"')
      mdatp = {:sig_version => sigver}
      mdatp
    rescue
    end
  end

  chunk(:sig_updated) do
    begin
      sigupdated = Facter::Core::Execution.execute('/bin/mdatp health --field definitions_updated | grep -v ATTENTION | tr -d \"')
      mdatp = {:sig_updated => sigupdated}
      mdatp
    rescue
    end
  end

  chunk(:update_status) do
    begin
      updatestatus = Facter::Core::Execution.execute('/bin/mdatp health --field definitions_status | grep -v ATTENTION | tr -d \"')
      mdatp = {:update_status => updatestatus}
      mdatp
    rescue
    end
  end
end
