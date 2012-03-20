class HousesController < ApplicationController
  
 
  def research
  end

  def data
	#render :file=>'c:/sites/rails_projects/sample_app2/app/views/houses/08Data', :content_type=>'application/xml', :format => [:xml],:layout => false
    #logger.warn params[:house]
	render '08Data', :format => [:xml], :layout => false
  end

  def pageData
    logger.debug "Params start"
    logger.debug request.post?

	postData = params[:Data].gsub("&lt;", "<")
	postData.gsub!("&gt;",">")

    #logger.debug postData

	hash = Hash.from_xml(postData)
	
	pageLength = 25

	pos = hash["Grid"]["Body"]["B"]["Pos"]

	logger.debug "Pos=" 
    logger.debug pos
    
	logger.debug "Params end"

	#render :file=>"08Page.xml", :content_type=>'application/xml'

	num = pos.to_i()
	startP = num*pageLength
	endP = (num+1)*pageLength
	#housePage = House.where("id > #{startP} AND id <= #{endP}")
	#housePage = House.find_by_id("1")
	
	housePage = House.select("mls,pin,city,subdiv,stat,strnum,cp,strname,sfx,rprnp,lpsp,rooms,beds,fullbaths,halfbaths,typ,sci,garages,info,asf,yearbuilt,dues,bsmt,bsmtdesc,closeddate,contractdate,fin,hsdist,hsname,listdate,listprice,lmt,origlistprice,shortsale,taxexempt,taxyear,taxes,baths,origrent,rd,rnp,rp").where("id > #{startP} AND id <= #{endP}")

	xml = "<Grid><Par><P Name=\"P\" List=\"Count,Expanded,mls,pin,c,sd,stat,strn,cp,strnam,sfx,rnp2,lsp,rm,bed,fbth,hbth,typ,sci,grg,info,asf,yrblt,due,bsmt,bsmtinf,clsdt,ctrtdt,fin,hsd,hsn,lstdt,lstpr,lmt,olstpr,ss,emp,taxyr,tax,bth,ornt,rd,rnp,rp\"/></Par><Body><B>"
	xml2 = ""
	housePage.each do |house|
	    xml2 << "<I>|P|0|0"
		house.attributes.each do |attr|
			xml2 << "|"
			xml2 << attr[1].to_s()
		end
		xml2 << "</I>"
	end
	xml << xml2
	xml << "/B></Body></Grid>"
	logger.debug xml
	render :text => xml, :format => [:xml], :layout => false

	#render '08Page', :format => [:xml], :layout => false
  end

  def pageLayout
    #logger.warn params
	#render :file=>"08layout.xml", :content_type=>'application/xml'
	render '08Layout', :format => [:xml], :layout => false
  end

  def QT
	#housePage = House.select("mls,strnum,cp,strname,sfx,rprnp,lpsp,listprice,lmt,origlistprice,origrent,rd,rnp,rp").where("mls =#{params[:row]}")

	#logger.debug params[:sd].empty?
	#logger.debug params[:c]

	@subdiv = params[:sd]
	#@city = params[:c]
	#@rnp = params[:rp]
	#@lsp= params[:lsp]
	@subjectHouse = House.select("mls,strnum,cp,strname,sfx,city,rprnp,lpsp,listprice,lmt,origlistprice,origrent,rd,rnp,rp").where("mls='#{params[:mls]}'").first

    @house = {}
	if params[:sd].empty? and params[:c].empty?
	elsif params[:sd].empty?
		@house = House.select("mls,strnum,cp,strname,sfx,city,rprnp,lpsp,listprice,lmt,origlistprice,origrent,rd,rnp,rp").where("city='#{params[:c]}'")
	else
		@house = House.select("mls,strnum,cp,strname,sfx,city,rprnp,lpsp,listprice,lmt,origlistprice,origrent,rd,rnp,rp").where("subdiv='#{params[:sd]}'")
	end
	logger.debug "Subject property"
	logger.debug @subjectHouse.strname
	
	logger.debug "similar property"
	logger.debug @house.first.rprnp

	render 'QuickTake'
  end

end
