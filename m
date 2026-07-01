Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC1374E67
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925956; cv=none; b=QtMSBGQaxsnNtQ9p++pXEI/N30n3lJyd5ysNFs4XQ5WPLZNr55JpQDRVWH3xJm2PiEDFGx+SjcsxzryQoVXpjLyEr3hA+XULRCm4Ufd7GReR45BOZGX/FNPbyizaKTX/GCEmq7S/JFoYxxnX/IaOnG635Oi8lpN3UP46LwhJ32c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925956; c=relaxed/simple;
	bh=Q/dh2h+abeH+DlLMMwqaF/gPfGsZ6kyRE8rRul6qj4A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XExZS586FMt7U06RKQs2zIq20yXLWqylFm58gC8whq+5E4sH4iRuibdaGGsWTDZpawRYi9DOk8y5e2aCTMEHvKSXky0ijp1oh3FG514yuQ9ucbjZOqiqcKyHbIu7kXLkyA/bzzqvnZQ1fj7+vK0wifkACSQsrES3Cfyw1PfhNiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hodpYSF6; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hodpYSF6"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c79e5de32cso9482725ad.2
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782925954; x=1783530754; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlW/Tw9gcgb1xINl+uo7R0Y4UPZxe1yGcJU8p6oXzuI=;
        b=hodpYSF6MgE3zjWPGCIffeceB6jxvsvh6G5jkXOSycw9BUzx9bDY7FV4DtyV8arzRx
         AC2fIVbOf/HgzMGLCdoGVt2FswRm5NW8nsvziQTeU9FvW+WOsvnG0untvtyMGsQOf1+x
         Le9qKV/xMZ8TldLm61GApJHwCiP/UfrjoSnX0pZ7JitnGanvV7fGwMnk/lSBEY4ipwBR
         AOSEROdrf2e9i+ePj5Xjz4DClWC9C2poIGe/30GzvWiv9LiGR0tFaEacwXKL/SiXuoZF
         wgQW9nZ9H1IuTmbJJg3E6CFgH7xRoHDnO4/JCLYSLo6a4RVQqSy8ZrCisB+4qSpziTPO
         kNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782925954; x=1783530754;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlW/Tw9gcgb1xINl+uo7R0Y4UPZxe1yGcJU8p6oXzuI=;
        b=iw1k90N2ZHHghjcvdLNOQnF2ckGgiDVTBTwUErJO+YtPuZ0aP/QYzNrwUaawJh4MnO
         pMplcuVae++1BtIaxrkOWVEYLmHjCQmTNUv9/Tt4EDH6Wqc4CKsEGj3snslGkdue42H7
         C0BLTuE4rxwJKbXJsP0F1IMRVMPyVJV155X41wP/eQfLtOutFXVcvo0nSs6QsiMY7jmc
         35kOPeL2Wg/BRSlyjlE2v4cIiYr3M4jojnb/0s8FDAsYy0Wlu67f5jqQV6ODlIkwjDBd
         hrQzUGPCWmHIzFlLCoCGz7oSrfrpcWA2LlcE7dR5dH0aA3J+Hfeh/e1ng3v0d7RqG6ek
         8TrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpt4Ce41GoPzzzOYiV4Hkbna1xBfRvLTo3dGbbfaI89uDWQXMQ0g0COMeg5QWoK83X/e8XEc8ZvJQ8a@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt2LaAwxj934sTmPWhTBRm+B8W79jJ8UJXW/e40fOxRq54nxiE
	EROaETtZ43D1Pko+LF91zDYepwO2J19azsOwK5dzfFMXNE2sxubmKpJRrp84qhZwT88ursWFx4D
	/lIxPDw==
X-Received: from plef18.prod.google.com ([2002:a17:902:f392:b0:2c7:eb53:9c06])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a90:b0:2ca:eea:eb5c
 with SMTP id d9443c01a7336-2ca9114efb0mr15378875ad.18.1782925954124; Wed, 01
 Jul 2026 10:12:34 -0700 (PDT)
Date: Wed, 1 Jul 2026 10:12:33 -0700
In-Reply-To: <323a9a1a-6cf9-4a68-b92a-867f497b3d34@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260630213711.479692-1-seanjc@google.com> <20260630213711.479692-3-seanjc@google.com>
 <323a9a1a-6cf9-4a68-b92a-867f497b3d34@linux.intel.com>
Message-ID: <akVKgY6JK9im5aDZ@google.com>
Subject: Re: [PATCH v2 2/2] KVM: TDX: Return EINVAL, not EOPNOTSUPP, for NULL
 INIT_MEM_REGION source
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko Bot <sashiko-bot@kernel.org>, 
	Joerg Roedel <joerg.roedel@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, Binbin Wu wrote:
> On 7/1/2026 5:37 AM, Sean Christopherson wrote:
> > Return EINVAL instead of EOPNOTSUPP if userspace attempts to pass a NULL
> > pointer for the source page of INIT_MEM_REGION, so that KVM's ABI is
> > consistent between TDX and SNP (for LAUNCH_UPDATE).  EOPNOTSUPP was chosen
> > to be a forward-looking error code for when guest_memfd supports in-place
> > conversion, but even when in-place conversion comes along, it's an awkward
> > error code as KVM is deliberately choosing to disallow virtual address '0',
> > which is technically a legal userspace address.  I.e. it's not so much a
> > lack of support as it is that KVM reserves address '0' to simplify KVM's
> > internal implementation.
> 
> Nit:
> Do you think it's worth calling this out in the documentation?

Yes, though that can be done separate since this series doesn't change ABI.
E.g. we can probably do it opportunistically as part of the in-place conversion
series?
