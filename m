Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2278BF5
	for <linux-coco@lists.linux.dev>; Thu, 16 Feb 2023 16:59:32 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9C92F1EC086F;
	Thu, 16 Feb 2023 17:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1676566764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=c7gJ7ThlATppSnCKM5wzsbFyaA1t7EIglqhT2LCjmwk=;
	b=SLz4HCs3MLtnKwtaiNOESvMgCKSTMGyBmb5sMdC9zcdVxU81Vk6IMyg6o8FhOUdhGJwaQ6
	V4r5dRFln65xjxwqSNZR62n+qtys+0dgUB3ijLQORNQHkxveqR8tkZ2i64fmjYl1wNIbJ2
	9S2a/8bP7ACcEHEikLtA1pKSB4FDmsM=
Date: Thu, 16 Feb 2023 17:59:20 +0100
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Dionna Glaze <dionnaglaze@google.com>, Joerg Roedel <jroedel@suse.de>,
	Michael Roth <michael.roth@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>, Peter Gonda <pgonda@google.com>,
	Tom Lendacky <Thomas.Lendacky@amd.com>, linux-coco@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH 11/11] x86/sev: Change snp_guest_issue_request()'s fw_err
 argument
Message-ID: <Y+5g6Hjm9oxRjwJX@zn.tnic>
References: <20230216124120.26578-1-bp@alien8.de>
 <20230216124602.26849-1-bp@alien8.de>
 <20230216124602.26849-6-bp@alien8.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230216124602.26849-6-bp@alien8.de>

On Thu, Feb 16, 2023 at 01:46:02PM +0100, Borislav Petkov wrote:
> @@ -390,18 +390,16 @@ static int __handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code,
>  		goto retry_request;
>  	}
>  
> -	if (fw_err)
> -		*fw_err = override_err ?: err;
> -

As Tom pointed out offlist, we still need to do the error override.
Frankly, I'm not crazy about this request retrying as we do it but
I guess it is what it is and it is too late to change that now.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
