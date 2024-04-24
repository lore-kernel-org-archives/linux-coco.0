Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACBB16F0C6
	for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 23:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714001221; cv=none; b=cXqdW+o2IydvqZgBulXe50fTMzs89sT9xvmp5GKg28oBLVFKLaDldVnyDlTLAXB3QxpK3j12JrueMTG6ZELfAN7br75nuhBPjDCp5LFnwizGPsn5wv6tJSx22XuntqJ3hyIlIJ7DqlzHXJvosHctaRGb6l9zUhfc8hyZgIxFhhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714001221; c=relaxed/simple;
	bh=QtOdWdlOdeRyzFugEhg6e9ksqQi4BaU2ioPkhsidgEY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RYtJ4C/1dSLIcO43/VA9bh4c7zXvPRAKV76KSX4ENaIFi2tIgq6oNSiKHdSzkappPrmx4NCqidQdCADt+IXdZL10OTp/kqaDgVWSdR0TSeo/6rJM58lCv28cjiNBmzYhSqizkRgM5PFCNwm1kmmgVLWGD98fp7bi/uzMGzPPYY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2DVEEmyD; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2DVEEmyD"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61ab00d8a2eso5988677b3.3
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 16:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714001218; x=1714606018; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CmG+3iHB+1BxNgRQoZJ+SwJOKBGJtBG8Ri4d9VDnrA=;
        b=2DVEEmyD6aCs01LOOuWNS7SzAYGNb6jALqh2LA1CerSpxvGhaPCbOdzk7ujToBqBCF
         KwVh6VtSG1hsLq9YV/2RDZinu4Yxxmt6EwoH0Zx1lb2FAcSdJwHLMMUmpTQkR1rWSLh7
         on7gb8a3IoRKYnxWo4Zs0mgbyDDvw14H4Tc8nbKcllWzLEaKCXcD69EtowwjYjsYpLnB
         IDGJ/zKzBcSbHoySPj7MpdLUKlv3K0ZqTGlRcCiCOL1Vk74+syE5l8RWl6B3o0tXulvu
         4eDJcFEKRLg6K68x9sejRfL2A+OU3h9HJgfqDpBqf4eoAEerkn3bWECu5xvXMJh9wBzU
         LDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714001218; x=1714606018;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CmG+3iHB+1BxNgRQoZJ+SwJOKBGJtBG8Ri4d9VDnrA=;
        b=wHbe4P04xf8A25ZK2MSgIgZR1spKTDtRkNfPc71Qi4SsaNOFXR1WoiH8HmCCqHVpMp
         4CQYSZQm92hfQCyhEvfV+/ZtXYPWCWKlVpOb9tM/icbHdS7Z+Uj/Dth+GMPAE3Lxmfl8
         qszzGOXVRPndyuK1KIoTlmC9KHcXO9HdbA11HKPVZyRNVgMJJ/3WTDnO04oLR95vidzO
         SV2bvgZ880A+45+whZAaxeT5etS7RHpWyOGhctkchIJbcK3sa7smGIHqxnjxtJqk0uQ8
         g2Zln3z2c4lVhbZKbuSLC3FuzU23ZxYdN0gccmEHhH1nIxLHkuDDEgwhkJM5/iszV70H
         objw==
X-Forwarded-Encrypted: i=1; AJvYcCXHqoKt2NCF+1HJdFIWjvCVxYpNAAwnN6LJC0BHzhQclxN4+2v+o8eBG2LB21Gvaofm2w2oTQy9PcU715FBBsVCtNDcZAxyED3zyg==
X-Gm-Message-State: AOJu0Yzsf+ozWoYlOEmfT95y5fhCkWz9sty4ajuREya355j3MTF/fhWj
	lyMZSjrEmMSe7Q02aEFBUYJN9DDOT4LjOTklWIfBKHto+NnQ3R1uAQUATqIq5BeONWlSemEheqS
	LOg==
X-Google-Smtp-Source: AGHT+IG9AFP7hY+ukqMVBTl39cuNC0vrXBttEQiu5m8xciLOlctXbTTnNj1cEOBjn+Fu9BaNN6kY8VHwld4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:e288:0:b0:61b:649:ac90 with SMTP id
 l130-20020a0de288000000b0061b0649ac90mr769275ywe.9.1714001218264; Wed, 24 Apr
 2024 16:26:58 -0700 (PDT)
Date: Wed, 24 Apr 2024 16:26:56 -0700
In-Reply-To: <20240421180122.1650812-6-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240421180122.1650812-1-michael.roth@amd.com> <20240421180122.1650812-6-michael.roth@amd.com>
Message-ID: <ZimVQKWGZyju3RbT@google.com>
Subject: Re: [PATCH v14 05/22] KVM: SEV: Add KVM_SEV_SNP_LAUNCH_START command
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Sun, Apr 21, 2024, Michael Roth wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> KVM_SEV_SNP_LAUNCH_START begins the launch process for an SEV-SNP guest.
> The command initializes a cryptographic digest context used to construct
> the measurement of the guest. Other commands can then at that point be
> used to load/encrypt data into the guest's initial launch image.
> 
> For more information see the SEV-SNP specification.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Co-developed-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---

I somehow ended up in the v13 series and gave feedback on that version, but AFAICT
all of the feedback still applies to v14.

https://lore.kernel.org/all/Zil8MnPXkCbqw3Ka@google.com
