Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A862C9A
	for <linux-coco@lists.linux.dev>; Wed, 11 Jan 2023 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673448989;
	bh=iLv4o2rzwZtn+yWt1Opy+Vn1DqD7Et9EMHU2t6cT5Wo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=apZ1FN9ni2s639/pCwxBbNNTJsDxPI/iIDKIkDjxFEMNQGXO9jv4vVOAkgtzRa0n6
	 xn8wAGoh97KcxefgakmbrCZyA8vTz2+aNidWizdCucruz9MMi1irRi3YKAX+pQ9CzE
	 QD8fZm051rYzap6o69kvOtxbn7HhQaifQx0JyA4E=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id F207C12860BF;
	Wed, 11 Jan 2023 09:56:29 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2YZj0LYn9mf; Wed, 11 Jan 2023 09:56:29 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673448989;
	bh=iLv4o2rzwZtn+yWt1Opy+Vn1DqD7Et9EMHU2t6cT5Wo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=apZ1FN9ni2s639/pCwxBbNNTJsDxPI/iIDKIkDjxFEMNQGXO9jv4vVOAkgtzRa0n6
	 xn8wAGoh97KcxefgakmbrCZyA8vTz2+aNidWizdCucruz9MMi1irRi3YKAX+pQ9CzE
	 QD8fZm051rYzap6o69kvOtxbn7HhQaifQx0JyA4E=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3D5931286083;
	Wed, 11 Jan 2023 09:56:29 -0500 (EST)
Message-ID: <48a2dfb1e8618c0032b9285d2fa33db462c30a90.camel@HansenPartnership.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Wed, 11 Jan 2023 09:56:27 -0500
In-Reply-To: <73a7ef36-2613-e75c-8f30-f2166c2a346f@amd.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
	 <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
	 <6303283f-cf1c-8be6-9359-69d556a89554@amd.com>
	 <7f6782cb049398e9fc28176fc15456f55a3365ea.camel@HansenPartnership.com>
	 <c29bf3a5-2970-245a-40af-569fc933282e@amd.com>
	 <594f0863c990fffb5e7258f8e3fbc5d014c12556.camel@HansenPartnership.com>
	 <73a7ef36-2613-e75c-8f30-f2166c2a346f@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-01-11 at 08:49 -0600, Tom Lendacky wrote:
> On 1/10/23 17:09, James Bottomley wrote:
> > On Tue, 2023-01-10 at 17:00 -0600, Tom Lendacky wrote:
> > > A GUID still works, though, to describe that the TPMT_PUBLIC
> > > supplied is for the EK - unless you want to go with the known
> > > handles, e.g. 0x81010001 for the EK RSA handle or 0x81010002 for
> > > the EK EC handle, etc.
> > 
> > You should probably use the hierarchy handle for that case:
> > 0x40000001 for the Owner (storage) seed and 0x40000006 for the
> > endorsement seed.
> 
> Looking at the spec, do you mean 0x4000000B for the endorsement seed?
> 
> Table 28 of the TPM 2.0 Structures document has TPM_RH_EK
> (0x40000006) as "not used", but TPM_RH_ENDORSEMENT (0x4000000B) as
> "references the Endorsement Primary Seed (EPS), endorsementAuth, and
> endorsementPolicy"

Yes, probably ... I don't really ever use it except as input the the
command line tsscreateprimary -hi e or create_tpm2_key --parent
endorsement.

But I still say don't bother: the endorsement key is all that needs to
be attested because there are well known processes to use it to attest
every other TPM key.  If you're using the SVSM vTPM because you care
about measurements, you need the endorsement key not the storage key
(you only need the latter if you're inserting other keys).

James

