Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64198B43C
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673392465;
	bh=tOThg8IkXMHlLENc+WaiRVNDqkwMgrcyEfTF14SaSpc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Yqm1eT14AU6V1ZCue54K9rwDGRiDd60SA9rXF3uft8mpRlRjDex7+3IiFNoGdACgJ
	 +gyEl5+1tyuATkeeNpPqDYDOn0ODvWz1r9Gn4/6WI4NwF3fWVfVZ8MLGaFezb3qqHb
	 tbl+kpwRr+yhWS0/pPUfgXo1L7jgGLIyshsxTNnM=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 91D4D1281DD6;
	Tue, 10 Jan 2023 18:14:25 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsY11bbV8gjh; Tue, 10 Jan 2023 18:14:25 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673392465;
	bh=tOThg8IkXMHlLENc+WaiRVNDqkwMgrcyEfTF14SaSpc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Yqm1eT14AU6V1ZCue54K9rwDGRiDd60SA9rXF3uft8mpRlRjDex7+3IiFNoGdACgJ
	 +gyEl5+1tyuATkeeNpPqDYDOn0ODvWz1r9Gn4/6WI4NwF3fWVfVZ8MLGaFezb3qqHb
	 tbl+kpwRr+yhWS0/pPUfgXo1L7jgGLIyshsxTNnM=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 085DE1281278;
	Tue, 10 Jan 2023 18:14:24 -0500 (EST)
Message-ID: <9abddd3c3a6ae966f3825ab88b2bf03080aed43b.camel@HansenPartnership.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Tue, 10 Jan 2023 18:14:23 -0500
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
[...]
> Ok, so this is different from what was originally talked about being
> just the EK EC key andr the SRK EC key.

Just to clarify, the IBM research attestation team is still doing
active prototypes here.  I suspect when the dust settles we'll want to
use a signing EK with no policy to avoid the make credential/activate
credential dance, but first we're using an dencryption EK with
hierarchy password policy to use the standard protocols with keylime. 
I just don't want us to get into the position where we settle on a key
type and then find there isn't a defined GUID for it.

James

