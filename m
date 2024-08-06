Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632D622075
	for <linux-coco@lists.linux.dev>; Tue,  6 Aug 2024 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722961452; cv=none; b=O38MPgndIlncUDrQQeP3Bw7jw8yFVpEq2ui+4MhoCemEB3I+46rPnjd+rTFYleleA4yIaN5uTYi/wO6mYzBXu/rI8iaA+lGI9XfJ0GI23uzjaw8/4gXchg5KWIGpYB0L5DeAOtElsnWQxxbimld/RVicKgGU4y8G4Q0M/X2Iii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722961452; c=relaxed/simple;
	bh=WBgRW+DqAPkx6XryG9DIGB7mu9AuewhXDnuGHSdhxnA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NwsYTbdEwTiyyudxdpmb8Ywf/sEcwh0UvNY8APL5153FD3hktUZF+dLDXoFV1VTnN/qKt+cjbOWpbW3NEqHDF3j4iAonNhob1qB9UECb/08266g5VpAOaMfyXwgDmDeaKGm2ZrK3ridwsFyzFthIjHHPcgKVPSn9DogTf1xfIjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=SlYDBXPs; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=SlYDBXPs; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="SlYDBXPs";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="SlYDBXPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722961445;
	bh=WBgRW+DqAPkx6XryG9DIGB7mu9AuewhXDnuGHSdhxnA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=SlYDBXPsqsipoTdXWTMsFYmgxwxQek3uhUanLm/wS2GcL7IzKLbGOtw9IKa7cOLTV
	 X3qxy6B03PBHLr3R/PsW7UZGQ8GgMWX/9alwq1AxBPZ/uymDnqsfoG6x4LRZ9ST5xv
	 H5vOCAC9LV45SSpg1192Dklcg+db9R0prNq/eLiA=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id E7D351286D12;
	Tue, 06 Aug 2024 12:24:05 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id jMn_YPNX-13A; Tue,  6 Aug 2024 12:24:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722961445;
	bh=WBgRW+DqAPkx6XryG9DIGB7mu9AuewhXDnuGHSdhxnA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=SlYDBXPsqsipoTdXWTMsFYmgxwxQek3uhUanLm/wS2GcL7IzKLbGOtw9IKa7cOLTV
	 X3qxy6B03PBHLr3R/PsW7UZGQ8GgMWX/9alwq1AxBPZ/uymDnqsfoG6x4LRZ9ST5xv
	 H5vOCAC9LV45SSpg1192Dklcg+db9R0prNq/eLiA=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 69A221286CAB;
	Tue, 06 Aug 2024 12:24:04 -0400 (EDT)
Message-ID: <ead3a13611e209bd994ca688e5ab0a9fa309383a.camel@HansenPartnership.com>
Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Claudio Siqueira de Carvalho <cclaudio@ibm.com>, 
 "elena.reshetova@intel.com" <elena.reshetova@intel.com>,
 "dionnaglaze@google.com" <dionnaglaze@google.com>
Cc: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "jroedel@suse.com"
 <jroedel@suse.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, 
 "jiewen.yao@intel.com" <jiewen.yao@intel.com>,
 "jpiotrowski@linux.microsoft.com" <jpiotrowski@linux.microsoft.com>,
 "eddie.dong@intel.com" <eddie.dong@intel.com>,  "ronald.perez@intel.com"
 <ronald.perez@intel.com>, "jlange@microsoft.com" <jlange@microsoft.com>, 
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "simon.p.johnson@intel.com" <simon.p.johnson@intel.com>
Date: Tue, 06 Aug 2024 12:23:59 -0400
In-Reply-To: <003d1f1d654525afc736d84ec9a9e22debde1785.camel@ibm.com>
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
	 <003d1f1d654525afc736d84ec9a9e22debde1785.camel@ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2024-08-06 at 15:51 +0000, Claudio Siqueira de Carvalho wrote:
> On Tue, 2024-08-06 at 08:21 +0000, Reshetova, Elena wrote:
> > > On Mon, 2024-08-05 at 09:55 +0000, Reshetova, Elena wrote:
> > > > > On Fri, 2024-08-02 at 18:54 -0700, Dionna Amalie Glaze wrote:
> > > [...]
> > > > > 
> > > > > That brings me to a curious point: is the Intel TDX SVSM
> > > > > going to follow the SVSM protocol interface?  because if it
> > > > > is, it will naturally inherit the enlightened interface (the
> > > > > code will be present in the kernel, so it only needs
> > > > > activating).  However, if the Intel SVSM were going to ignore
> > > > > the SVSM protocol spec then it would have to reinvent
> > > > > everything and the CRB interface might make more sense.
> > > > 
> > > > I cannot speak on behalf of the Intel TDX *SVSM*
> > > > implementation, but for the Linux guest kernel there is no
> > > > intention at the moment to support smth like SVSM protocol
> > > > interface. We have made an evaluation on this during the
> > > > spring. There are no usecases currently that require such new
> > > > protocol introduction on Intel TDX and it does bring additional
> > > > code complexity, etc. If anyone believes otherwise, please let
> > > > me know.
> > > 
> > > If you reinvent the vTPM communication interface, I can see you
> > > are able to get away without that SVSM communication component.
> > 
> > The goal is exactly the opposite, i.e. don't reinvent anything, but
> > try to stick with exiting ways on how we have been doing things so
> > far in Linux. In this light SVSM is an invention to do things.
> 
> How will Intel attest the SVSM services provided?

It's in the document they provided at the top of this thread.  I gave
an analysis here:

https://lore.kernel.org/all/13ea31e26a9891722748c5d6e823f77b6c8b7809.camel@HansenPartnership.com/

But basically it's the old trick of using a hash of the public EK as
the nonce for a TDX atestation report and wrapping it in an EK
certificate.  The problem is it doesn't allow the attesting agent to
supply the challenge (nonce) so it's not best practice.

Regards,

James

