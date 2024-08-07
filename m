Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCAA1C37B0
	for <linux-coco@lists.linux.dev>; Wed,  7 Aug 2024 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723033294; cv=none; b=DADmcp3JtmZI4VRGHjQo36dv5M77zW5eiV2RbNEeV6ZoGyFKjGLOLVUFc7+9Dxu7tEqfF/NxXpfb55CFPduhjLus7A6sXlvm9qQ9XMsAoQ/vtcA9R6h0z1NU9u7VW86m5LlBCKiAYdUyQv+C+1JOaIMu4aaXrQK7KnIBmn9pFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723033294; c=relaxed/simple;
	bh=9qbL39CfHBgEXOxPzhj5m4cbpP43Lbj5Zgm/KE2NQ9k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BTE5ZjHaC1zpAvC61/mlXJraib5ZCbR7HNZT3ejt3GDcXQrpU0iuVQT7St8xwe4bZ/odWRcNxuf0sqqbF5Occ29mJr1n6AqMGuJXA6TRQtzg/6r/jV4G3tFi2FB2le4IRdC7oGG5uhJWlgX31dG4PxkUNINTQTB4f1aWe1sKmzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=GnhF9051; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=GnhF9051; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="GnhF9051";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="GnhF9051"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1723033290;
	bh=9qbL39CfHBgEXOxPzhj5m4cbpP43Lbj5Zgm/KE2NQ9k=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=GnhF9051CIwBRsM54FGD0if7sbW/bYcgV2syg7Mvd8QyPPpQNP19tNXmdGnM1mORm
	 g2H7OR7fjugBqW7XP1AqxLpFyZNidqpUOP5tUT8E+L3nMGwqzWfVkRZJwH2LHHW7On
	 VHI845pC5vfFwyPFb/lQkPFtl2p11ybv1DqNh0Zo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id E472A1280C69;
	Wed, 07 Aug 2024 08:21:30 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id AvlnYQaubul8; Wed,  7 Aug 2024 08:21:30 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1723033290;
	bh=9qbL39CfHBgEXOxPzhj5m4cbpP43Lbj5Zgm/KE2NQ9k=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=GnhF9051CIwBRsM54FGD0if7sbW/bYcgV2syg7Mvd8QyPPpQNP19tNXmdGnM1mORm
	 g2H7OR7fjugBqW7XP1AqxLpFyZNidqpUOP5tUT8E+L3nMGwqzWfVkRZJwH2LHHW7On
	 VHI845pC5vfFwyPFb/lQkPFtl2p11ybv1DqNh0Zo=
Received: from [172.16.56.202] (unknown [82.3.55.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 7074812804E6;
	Wed, 07 Aug 2024 08:21:26 -0400 (EDT)
Message-ID: <f3de5c989f718ba999d4c3b00ffc6a06a1898c6c.camel@HansenPartnership.com>
Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Reshetova, Elena" <elena.reshetova@intel.com>, Claudio Siqueira de
 Carvalho <cclaudio@ibm.com>, "dionnaglaze@google.com"
 <dionnaglaze@google.com>
Cc: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "jroedel@suse.com"
 <jroedel@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, "Yao, Jiewen"
 <jiewen.yao@intel.com>, "jpiotrowski@linux.microsoft.com"
 <jpiotrowski@linux.microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, 
 "Perez, Ronald" <ronald.perez@intel.com>, "Lange, Jon"
 <jlange@microsoft.com>, "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>, "Johnson, Simon P" <simon.p.johnson@intel.com>
Date: Wed, 07 Aug 2024 13:21:22 +0100
In-Reply-To: <DM8PR11MB5750F26CA8292B1053722E10E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
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
	 <ead3a13611e209bd994ca688e5ab0a9fa309383a.camel@HansenPartnership.com>
	 <DM8PR11MB5750F26CA8292B1053722E10E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2024-08-07 at 11:28 +0000, Reshetova, Elena wrote:
> > On Tue, 2024-08-06 at 15:51 +0000, Claudio Siqueira de Carvalho
> > wrote:
> > > On Tue, 2024-08-06 at 08:21 +0000, Reshetova, Elena wrote:
> > > > > On Mon, 2024-08-05 at 09:55 +0000, Reshetova, Elena wrote:
> > > > > > > On Fri, 2024-08-02 at 18:54 -0700, Dionna Amalie Glaze
> > > > > > > wrote:
> > > > > [...]
> > > > > > > 
> > > > > > > That brings me to a curious point: is the Intel TDX SVSM
> > > > > > > going to follow the SVSM protocol interface?  because if
> > > > > > > it
> > > > > > > is, it will naturally inherit the enlightened interface
> > > > > > > (the
> > > > > > > code will be present in the kernel, so it only needs
> > > > > > > activating).  However, if the Intel SVSM were going to
> > > > > > > ignore
> > > > > > > the SVSM protocol spec then it would have to reinvent
> > > > > > > everything and the CRB interface might make more sense.
> > > > > > 
> > > > > > I cannot speak on behalf of the Intel TDX *SVSM*
> > > > > > implementation, but for the Linux guest kernel there is no
> > > > > > intention at the moment to support smth like SVSM protocol
> > > > > > interface. We have made an evaluation on this during the
> > > > > > spring. There are no usecases currently that require such
> > > > > > new
> > > > > > protocol introduction on Intel TDX and it does bring
> > > > > > additional
> > > > > > code complexity, etc. If anyone believes otherwise, please
> > > > > > let
> > > > > > me know.
> > > > > 
> > > > > If you reinvent the vTPM communication interface, I can see
> > > > > you
> > > > > are able to get away without that SVSM communication
> > > > > component.
> > > > 
> > > > The goal is exactly the opposite, i.e. don't reinvent anything,
> > > > but
> > > > try to stick with exiting ways on how we have been doing things
> > > > so
> > > > far in Linux. In this light SVSM is an invention to do things.
> > > 
> > > How will Intel attest the SVSM services provided?
> > 
> > It's in the document they provided at the top of this thread.  I
> > gave
> > an analysis here:
> > 
> > https://lore.kernel.org/all/13ea31e26a9891722748c5d6e823f77b6c8b7809.ca
> > mel@HansenPartnership.com/
> > 
> > But basically it's the old trick of using a hash of the public EK
> > as
> > the nonce for a TDX atestation report and wrapping it in an EK
> > certificate.  The problem is it doesn't allow the attesting agent
> > to
> > supply the challenge (nonce) so it's not best practice.
> 
> As you yourself mentioned earlier, for ephemeral vTPM it is 
> acceptable. Persistent vTPM has not been in scope of this current
> release so the requirement to provision the nonce hasn’t been
> there. Again, once Jiewen comes back from the vacation, he can
> share his thoughts on how persistent vTPM can be implemented 
> in the future. 

Sure ... the plan was always to do ephemeral first because it's easier.
The best practice comment is what the security guys told me when I
presented the public key hash as nonce scheme.  They can't find an
actual security flaw in it, but they say it's best practice to let the
relying party supply the nonce.

> You keep pointing out the problem of the 'absent nonce': it is not
> possible for attesting agent to provide a nonce to be included into
> attestation report/quote and saying that we are missing an interface
> from the OS guest (L2 guest) to SVSM to supply this nonce to the
> SVSM. Is this correct summary? If yes, we have an exiting interface
> in Linux OS to ask for the report/quote via configfs-tsm interface
> where a fresh nonce (or anything you need) can be provided.

OK, so now I'm confused again.  In order to be reliable, the vTPM
attestation report must provably come only from the SVSM.  With AMD we
can do this because the VMPL level the report was generated at is
included in the signed data, so VMPL0 proves it was from the SVSM. 
Nothing prevents the guest from generating an almost identical report
using the attestation APIs, but that report would have VMPL2 as the
reporting level proving it didn't come from the SVSM.

I thought I picked up from the slides that the equivalent Intel scheme
poisons all the RTMRs with a separator before transitioning from the
SVSM to the guest (so after generating the vTPM report)?  Which seems
to indicate that after this is done, even the SVSM can't generate
reports with SVSM provenance any more.

> This interface can be used without modifications from
> L2 guest also (with SVSM emulation support of course).
> The rest is up to vTPM and SVSM design on how to plug this into
> persistent vTPM architecture. 

So I'm sure you can come up with a different scheme to identify an SVSM
produced report that will work after it has transitioned to the guest,
but in order to have the SVSM generate the report, you'll still have to
communicate with it (to tell it the nonce and retrieve the report).

James

