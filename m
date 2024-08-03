Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733895C99
	for <linux-coco@lists.linux.dev>; Sat,  3 Aug 2024 02:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722651591; cv=none; b=Ie8X4ctK47KVhCJ2g1Rd7b08BQNzk/hor2tyeSe7AnVyueFm/kiCrUEhZ7YbpzGU6/LzZU8jQEuFp7cpNUT/GfjtLH6uxkWbZvGtWP6W2cE2LAxX8b4ie9GRaj7sIF5IAYlgMu7DJE92RkGpxeD/H8YImwugPYgHdtVi835xV0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722651591; c=relaxed/simple;
	bh=Xs0w4Vf2jCMP4soG7SlHRreZ+jlwBBwGt3WBKP7w3xY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kFz1DYTzeggT0cihoWHtvn3Izrg1wCnqrg7qIALo8pGMV8JEvq9hWLcLEoX/DvhIteeWOLqJyEZTHFjayrLH8YCy9vFr/tJXl/ZEEOCAK8Ln/8yecldRRRs/SPNrAgKmQWsf74VzesHOh03QRNus/RISPZFzMXOjtxCsMn6jNwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=S2HJKQDU; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=S2HJKQDU; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="S2HJKQDU";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="S2HJKQDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722651588;
	bh=Xs0w4Vf2jCMP4soG7SlHRreZ+jlwBBwGt3WBKP7w3xY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=S2HJKQDUT0Iqkpv0Cn1VRGR7NAvJ3wp6sUrCwUPl0Q7OTuT9jHtfM9HgzoNoTYjaL
	 1frR/Y/unHgh+Csuwpib3O1X1JVmH5c/W+J26yeecSfJdkygTV0cs5d3pluQ5xc9NX
	 cBX0W/+mI3933CvaEFLXw/P40y7EYVVqABemtNHk=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id BB6081285D88;
	Fri, 02 Aug 2024 22:19:48 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id u-KVluAxdsf6; Fri,  2 Aug 2024 22:19:48 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722651588;
	bh=Xs0w4Vf2jCMP4soG7SlHRreZ+jlwBBwGt3WBKP7w3xY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=S2HJKQDUT0Iqkpv0Cn1VRGR7NAvJ3wp6sUrCwUPl0Q7OTuT9jHtfM9HgzoNoTYjaL
	 1frR/Y/unHgh+Csuwpib3O1X1JVmH5c/W+J26yeecSfJdkygTV0cs5d3pluQ5xc9NX
	 cBX0W/+mI3933CvaEFLXw/P40y7EYVVqABemtNHk=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 7C96B1281D85;
	Fri, 02 Aug 2024 22:19:47 -0400 (EDT)
Message-ID: <f809dfb51e14d93ec5538fba31d3d1478d69484c.camel@HansenPartnership.com>
Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: "Yao, Jiewen" <jiewen.yao@intel.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, 
 Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
 =?ISO-8859-1?Q?R=F6del=2C_J=F6rg?= <jroedel@suse.com>,  "Lange, Jon"
 <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, "Johnson,
 Simon P" <simon.p.johnson@intel.com>, "Reshetova, Elena"
 <elena.reshetova@intel.com>,  "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Perez, Ronald" <ronald.perez@intel.com>, "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>
Date: Fri, 02 Aug 2024 22:19:45 -0400
In-Reply-To: <CAAH4kHbiDaZjae21b2XPpWyPehBhGghshqz0jYf29G2p_vGKVQ@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2024-08-02 at 18:54 -0700, Dionna Amalie Glaze wrote:
> More questions / comments
> 
> 1.1 "Get TPM AK Cert (signed by EK)". This is something I thought for
> a long time too. That's not what the EK does. The EK does not sign
> anything. It's used for proving ownership of both EK and AK for
> ActivateCredential to get an AKcert from a trusted CA.
> What is your intended communication channel between SVSM and a CA for
> this credential activation?

Well, that's only if you need a privacy preserving mechanism for
certifying to outside entities.  If you're acting on behalf of the
machine to the machine owner, there's no credible point to the whole
encryption EK, signing AK dance and you might as well use a signing EK.

I just published tools for allowing certification of the null seed used
by the kernel for session salting:

https://lore.kernel.org/linux-integrity/20240802202606.12767-1-James.Bottomley@HansenPartnership.com

And it uses a signing EK for similar reasons (it's long lived and there
are no privacy concerns if it acts solely for the machine owner).

> 2.2.2 item 6, migration needs to ensure that the vTPM state is not
> duplicated, which is a possible host attack by spinning up two
> targets and directing migration to both. This needs to be explicitly
> required for TPM security.
> 2.2.3 item 8 I don't think the community has fully agreed that MMIO
> should be the command pathway for SVSM-based vTPM due to performance
> problems. This appears to disallow an SVSM service call
> implementation as an enlightenment path.

Well, no, for the AMD SNP SVSM an enlightened TPM interface makes the
most sense because everything else is enlightened.  

That brings me to a curious point: is the Intel TDX SVSM going to
follow the SVSM protocol interface?  because if it is, it will
naturally inherit the enlightened interface (the code will be present
in the kernel, so it only needs activating).  However, if the Intel
SVSM were going to ignore the SVSM protocol spec then it would have to
reinvent everything and the CRB interface might make more sense.

Regards,

James

