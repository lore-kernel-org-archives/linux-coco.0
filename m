Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E107474
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673387259;
	bh=fXKgPo1lXCd66yyT8jeaWSAL2DnHaFPfb5U/8pN+PMI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=dcoJcYF2Ei/89V8X2IRJsi59sWHu+wKCQWM7TG4TBbvf4cs9uQLl+URZVsx60ogYe
	 ++jTELrat1kPhUnNfl/k5+vv2c5woXKtlIZ35O+Bocg8rqekIr+etROMwh33tQTb9R
	 wpHJRak1Suc170PG/jzwP5jsLL+Pi0D2JhvqcNno=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id EC3BC1281DCE;
	Tue, 10 Jan 2023 16:47:39 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFMdwGirIVmd; Tue, 10 Jan 2023 16:47:39 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673387259;
	bh=fXKgPo1lXCd66yyT8jeaWSAL2DnHaFPfb5U/8pN+PMI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=dcoJcYF2Ei/89V8X2IRJsi59sWHu+wKCQWM7TG4TBbvf4cs9uQLl+URZVsx60ogYe
	 ++jTELrat1kPhUnNfl/k5+vv2c5woXKtlIZ35O+Bocg8rqekIr+etROMwh33tQTb9R
	 wpHJRak1Suc170PG/jzwP5jsLL+Pi0D2JhvqcNno=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 45D03128147C;
	Tue, 10 Jan 2023 16:47:39 -0500 (EST)
Message-ID: <7f6782cb049398e9fc28176fc15456f55a3365ea.camel@HansenPartnership.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Tue, 10 Jan 2023 16:47:37 -0500
In-Reply-To: <6303283f-cf1c-8be6-9359-69d556a89554@amd.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
	 <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
	 <6303283f-cf1c-8be6-9359-69d556a89554@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2023-01-10 at 15:32 -0600, Tom Lendacky wrote:
[...]
> My thoughts were to again use GUIDs to identify the key and key-type 
> present, i.e. EK RSA-2048 or EK EC (NIST-P256), etc:
> 
>         16-byte data GUID (e.g. EK EC (NIST-P256))
>         4-byte data length
>         data
> 
>         16-byte data GUID (e.g. SRK EC (NIST-P256))
>         4-byte data length
>         data

I really wouldn't use GUIDS because the TPM structures should all be
self describing.  The structure we're thinking of packing into the
attestation report to be hashed with the nonce is the TPMT_PUBLIC of
the EK.  The algorithm, attributes, policy and name hash which are in
the public area should define the exact template that was used to
construct the public key.  Note that there are about 2^70 possible
combinations, which is why I don't think you want a GUID for each one
...

James

