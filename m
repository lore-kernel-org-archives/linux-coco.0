Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F279C9
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 15:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673537063;
	bh=z55X8bbXj9uTlMOVj3iB7SPwu613iPjMusFbmnLXr+g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=ay9TAGWfmgm1Z4cE35mYKwJNSSLUlbTk+A1uaTU+hShyW14W9ZfmF87ba4FJsH3hS
	 yW3/PT9R1j280DZHOzyd9yJJg2q9mkmlrll5VbVGIuyuzs+2Aqn9VWBmV4PXcs6NUr
	 N21IUjGHpw59PWUQfM9QBucpu1mW0B3uLWtV2Gjk=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 07A9E1285D34;
	Thu, 12 Jan 2023 10:24:23 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RigyKySJNuDc; Thu, 12 Jan 2023 10:24:22 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673537062;
	bh=z55X8bbXj9uTlMOVj3iB7SPwu613iPjMusFbmnLXr+g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=m0/O9EeEG3FKmq0JiaXOoLcFg8atIXG7wF79C2lu8iH6jGs0LgJ9YK1pfqg8ys96Q
	 xsYdFAH3Mjz78Kk2rTuVDA6QPSXyOEjIolLVcvUOVKoC6Rrs81PY+lneY87KQxm6EC
	 E0TNR2L/Y6PBkY0nTJ3CwAyAet6kYNTuTACo0R9E=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 610D51285CDA;
	Thu, 12 Jan 2023 10:24:22 -0500 (EST)
Message-ID: <028752ebb328e3e9e4ce2a61b04d598f547e894e.camel@HansenPartnership.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, Christophe de Dinechin
	 <dinechin@redhat.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Thu, 12 Jan 2023 10:24:21 -0500
In-Reply-To: <6705338d-2fb7-4f6d-6a5b-2a860e894a20@amd.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
	 <m2tu0wrjv0.fsf@redhat.com>
	 <777e87d6c77b2c6287040242f1f2759266778eff.camel@HansenPartnership.com>
	 <6705338d-2fb7-4f6d-6a5b-2a860e894a20@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2023-01-12 at 09:13 -0600, Tom Lendacky wrote:
> On 1/12/23 07:57, James Bottomley wrote:
> > On Wed, 2023-01-11 at 17:39 +0100, Christophe de Dinechin wrote:
> > [...]
> > > p29: Table 14: How can RAX be used as command ordinal and command
> > > response size if it's already used for call identifier / result
> > > value?
> > 
> > I think there's a bug on the first table: in the prototype we use
> > RAX [in] (not RCX [in]) for the pointer to the request/response
> > buffer and RAX [out] as the SVSM return code.
> 
> No, it's not a bug. You'll need to use RCX as the pointer to the 
> request/response buffer because RAX, per calling convention, contains
> the protocol id and call id.

Oh, right, I should have looked at the code first before commenting we
do indeed use RCX for the shared buffer.

Do you have a timetable for updating the linux-svsm github for the new
protocol based calling convention?  We'd like to rebase the new vTPM
code off it when it's available.

James

