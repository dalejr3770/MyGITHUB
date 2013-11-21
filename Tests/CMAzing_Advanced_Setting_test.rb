$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..') unless $SETUP_LOADED
require 'rubygems' 
require 'watir-webdriver' 
require 'test/unit'
require 'lib/common'
require 'lib/cmazing'
require 'lib/backendcommon'


class TC_CMAzing_advanced_setting_test < Test::Unit::TestCase
include CMAzing
include Common
include BackendCommon

#J McFee 05/25/2012  
#
#Date Last Modified:
#
#===Purpose: 
#This test check the CMAZing Advanced Setting links.
#===Useage: 
#Open this test in Scite and press Tools/Run. 
#===Comment: 
#Login and sign Out are the only options.
#approx run time = 50 seconds.
#
	def test_CMAzing_advanced_setting_links
		begin
			@test = false
		
			@filename = (__FILE__).gsub(".rb","")
			
			log_initialize

			set_identity('website')
						
			start_test(@url)
			
			login	

			open_myapps_select_cmazing()
				
				advanced_setting('Manage CMA Settings')

			open_myapps_select_cmazing()
			
				advanced_setting('Manage Buyer Tour Settings')
			
			sleep 3.0
			
			myaccount('Sign Out')
			
			@test = true
				
		rescue Watir::Wait::TimeoutError  => e  			
			log_to_rescue_failure
		rescue Watir::Exception::UnknownObjectException  => e  			
			log_rescue_failure
		ensure
			$browser.close
			completed(@test)
			log_table_writer(true)
		end #begin
		
	end #def
	
end #class

