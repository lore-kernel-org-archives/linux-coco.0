Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91E4B43B
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 23:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673392151;
	bh=Cq/JBPTrYb33XUUcg+QbXfoaqfoReg40QJV2qChHnbw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=pF9zluazZ8rCnx132hybvya5H2SST0dJ3SUiYMvD7o73b8DINQEbS3LPqFJxTfSk4
	 H77LP1J3MqsMXYtWPBsotpsAuTxxpmqsHHDbgQT41k80q/95/3xdXGz97cnw9Hs00b
	 2SmKvsYd0/mdeYSjFWMAS1ce35a26GKkDbID9BjA=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id D65A31281278;
	Tue, 10 Jan 2023 18:09:11 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VA4dX7ca-Nwq; Tue, 10 Jan 2023 18:09:11 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673392151;
	bh=Cq/JBPTrYb33XUUcg+QbXfoaqfoReg40QJV2qChHnbw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=pF9zluazZ8rCnx132hybvya5H2SST0dJ3SUiYMvD7o73b8DINQEbS3LPqFJxTfSk4
	 H77LP1J3MqsMXYtWPBsotpsAuTxxpmqsHHDbgQT41k80q/95/3xdXGz97cnw9Hs00b
	 2SmKvsYd0/mdeYSjFWMAS1ce35a26GKkDbID9BjA=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 4569612809AD;
	Tue, 10 Jan 2023 18:09:11 -0500 (EST)
Message-ID: <594f0863c990fffb5e7258f8e3fbc5d014c12556.camel@HansenPartnership.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Tue, 10 Jan 2023 18:09:08 -0500
In-Reply-To: <c29bf3a5-2970-245a-40af-569fc933282e@amd.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
	 <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
	 <6303283f-cf1c-8be6-9359-69d556a89554@amd.com>
	 <7f6782cb049398e9fc28176fc15456f55a3365ea.camel@HansenPartnership.com>
	 <c29bf3a5-2970-245a-40af-569fc933282e@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2023-01-10 at 17:00 -0600, Tom Lendacky wrote:
> A GUID still works, though, to describe that the TPMT_PUBLIC supplied
> is for the EK - unless you want to go with the known handles, e.g.
> 0x81010001 for the EK RSA handle or 0x81010002 for the EK EC handle,
> etc.

You should probably use the hierarchy handle for that case: 0x40000001
for the Owner (storage) seed and 0x40000006 for the endorsement seed. 
However, I'd just specify the endorsement seed in the spec and be done
with it.  Once you know the EK, you can use it to certify any SRK you
create from the owner seed.

>  You still  need to identify what key is represented by the
> TPMT_PUBLIC structure, right, or am I missing something about the
> TPMT_PUBLIC structure?

All you need to know is what hierarchy seed (which is why I propose
endorsement).  After that the TPMT_PUBLIC defines exactly the
properties of the derived key, including the algorithm (RSA or EC
curve, etc).

James


