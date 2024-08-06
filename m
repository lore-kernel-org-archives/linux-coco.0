Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB97A2C697
	for <linux-coco@lists.linux.dev>; Tue,  6 Aug 2024 16:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722961164; cv=none; b=KKn8fOfhCxQolkotqKw3Wq9PCsIUroGGcBSnxfBs2SH6Y37/ptVgvZAuuIR1tDNnSbVoIbOKkxPjn8lKJcSFjymXAxxOao/34IK+1Y0Jyk+wZHc4NbVlZ0pFj+2JtM/qsgMa39kv2s1dTQKHhzX8s9HRB9vDFEAraWufs11eP0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722961164; c=relaxed/simple;
	bh=j+Zb4N0s2GGq83zL+sUUileZnz9kXD/wX+gIpcVHGkM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UwDWamXcm1pZKX/tlc//3O/J7j/8a2l/nj0cxYJfZm2rXGlP+RLnZTxsu+xy5DAjzo6/ehcfgCGzvaz+6mpfpGMA6s88YjDM84NY2gdjZt7iTz7UM2wBoZuEuYy2kWyF6KHlPnWEIjpl1knoo8Hd3HpO8PcFVkwFB7TcSTEssHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=xZ5snQxe; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=xZ5snQxe; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="xZ5snQxe";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="xZ5snQxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722961161;
	bh=j+Zb4N0s2GGq83zL+sUUileZnz9kXD/wX+gIpcVHGkM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xZ5snQxeNyS4C0YM/qrc/9Q/xpD2R7FcAngo4cwmt7h63WBZOmKPAzqWznE5P8mtD
	 V5mKfmxEJu6ucSX+QseQJyzmXosTyLsIBO7//cZkMSrEC5Po2ZTYehg56iJlc17q/n
	 unybAzrMSAvCKBKehf4pRt5mev9dcdeqmq0S6h6o=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id DAD1F1286C78;
	Tue, 06 Aug 2024 12:19:21 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id L3jhBi892lpQ; Tue,  6 Aug 2024 12:19:21 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722961161;
	bh=j+Zb4N0s2GGq83zL+sUUileZnz9kXD/wX+gIpcVHGkM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xZ5snQxeNyS4C0YM/qrc/9Q/xpD2R7FcAngo4cwmt7h63WBZOmKPAzqWznE5P8mtD
	 V5mKfmxEJu6ucSX+QseQJyzmXosTyLsIBO7//cZkMSrEC5Po2ZTYehg56iJlc17q/n
	 unybAzrMSAvCKBKehf4pRt5mev9dcdeqmq0S6h6o=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id A230F1286BDE;
	Tue, 06 Aug 2024 12:19:20 -0400 (EDT)
Message-ID: <afd3bf54fd77a1d6922192e1865c5cefadff7d92.camel@HansenPartnership.com>
Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Reshetova, Elena" <elena.reshetova@intel.com>, Dionna Amalie Glaze
	 <dionnaglaze@google.com>
Cc: "Yao, Jiewen" <jiewen.yao@intel.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, 
 Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
 =?ISO-8859-1?Q?R=F6del=2C_J=F6rg?= <jroedel@suse.com>,  "Lange, Jon"
 <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, "Johnson,
 Simon P" <simon.p.johnson@intel.com>, "Nakajima, Jun"
 <jun.nakajima@intel.com>,  "Perez, Ronald" <ronald.perez@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Date: Tue, 06 Aug 2024 12:19:18 -0400
In-Reply-To: <DM8PR11MB5750563E06F6E7C278667768E7BF2@DM8PR11MB5750.namprd11.prod.outlook.com>
References: 
	<MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
	 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
	 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
	 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
	 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
	 <CAAH4kHbiDaZjae21b2XPpWyPehBhGghshqz0jYf29G2p_vGKVQ@mail.gmail.com>
	 <f809dfb51e14d93ec5538fba31d3d1478d69484c.camel@HansenPartnership.com>
	 <DM8PR11MB575078E846B4E1E70D6A317AE7BE2@DM8PR11MB5750.namprd11.prod.outlook.com>
	 <ab64151d817e32ae440668ad8fc7b42eddc59d07.camel@HansenPartnership.com>
	 <DM8PR11MB5750563E06F6E7C278667768E7BF2@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2024-08-06 at 08:21 +0000, Reshetova, Elena wrote:
> > On Mon, 2024-08-05 at 09:55 +0000, Reshetova, Elena wrote:
> > > > On Fri, 2024-08-02 at 18:54 -0700, Dionna Amalie Glaze wrote:
> > [...]
> > > > 
> > > > That brings me to a curious point: is the Intel TDX SVSM going
> > > > to follow the SVSM protocol interface?  because if it is, it
> > > > will naturally inherit the enlightened interface (the code will
> > > > be present in the kernel, so it only needs activating). 
> > > > However, if the Intel SVSM were going to ignore the SVSM
> > > > protocol spec then it would have to reinvent everything and the
> > > > CRB interface might make more sense.
> > > 
> > > I cannot speak on behalf of the Intel TDX *SVSM* implementation,
> > > but for the Linux guest kernel there is no intention at the
> > > moment to support smth like SVSM protocol interface. We have made
> > > an evaluation on this during the spring. There are no usecases
> > > currently that require such new protocol introduction on Intel
> > > TDX and it does bring additional code complexity, etc.
> > > If anyone believes otherwise, please let me know.
> > 
> > If you reinvent the vTPM communication interface, I can see you are
> > able to get away without that SVSM communication component.
> 
> The goal is exactly the opposite, i.e. don't reinvent anything, but
> try to stick with exiting ways on how we have been doing things so
> far in Linux. In this light SVSM is an invention to do things.

You want the SVSM vTPM service for its tight binding to the guest VM, I
believe ... and you want to add a CRB emulation to the SVSM that
currently doesn't exist.

>  I assume you've done the same for other SVSM provided services like
> > deposit/remove memory and vcpu create/delete, but what about
> > migration when it comes along? 
> 
> Could you please give an example of where let's say we are not ok
> with existing Linux ways of depositing/removing memory?

OK, I looked but couldn't find it: how do you current add and remove
memory from the SVSM if you don't communicate with it?

>  Why do we need to create a new protocol like SVSM from guest kernel
> for doing this? It can be done if there is a valid usecase of course.
> All I am saying is that we haven’t found any yet.

Even in your model the SVSM performs services on behalf of the guest. I
think you mostly use traps and emulation instead of communication along
enlightened interfaces to get the SVSM to perform the services but one
of the historical lessons of virtualization has been that paravirt
enlightenments are useful in places (most particularly drivers).

Regards,

James


>  Since the high level operations will be pretty
> > much identical on AMD and Intel it would be very annoying to have
> > to do it in completely different ways (with presumably different
> > tools).
> 
> Migration is a separate story, which i dont think has any conclusion
> yet or agreement in the community. We (Intel TDX) have a way to
> migrate the guest without the guest assistance, so we dont have a
> strict requirement to migrate out of SVSM. It remains to be seen what
> method(s) is to be selected at the end. And if svsm-based migration
> method is going to be supported for intel tdx, then it needs a
> separate analysis to determine what is the actual required
> communication between the L2 guest and SVSM in our case and whenever
> the usage of the SVSM-style protocol is necessary.  
> 
> Imo migration is one of the topics that would be great to discuss at
> LPC.
> 
> Best Regards,
> Elena. 
> 
> > 
> > Regards,
> > 
> > James
> 

