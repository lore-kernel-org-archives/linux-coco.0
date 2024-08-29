Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8991A3BDD
	for <linux-coco@lists.linux.dev>; Thu, 29 Aug 2024 14:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943020; cv=none; b=tPuFzz+OBly6QPU02CstLGhHSlzEEPzWvHJGbbwKtEPxaj5xqPutDkAey0++jkff7S8wBbjQt+LB+/f8lRFxJ09LUclgbCZhos9pINst+3R2jQCZ+sLcnpDM4vLuOygdMB6QEk48eZwYbBiWNnbe9s3BufarVZvLLsExPMDPp4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943020; c=relaxed/simple;
	bh=7owvFBq7H/zZo+uLT3Wf+SvWErVFCaIRpkT2UIT2MZE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xolo8MnYpweOaon2x1/tPrw3jWks8S5cQYxAFVKPjU4EIs+/FUEPWhr+N5hg0OuaPRwI63QOS3tVaOvGL4LxORGByakRhrAmd7pk4KlH7q/VEhFAbFStYHtaI2o7vdGavzuN7DWjBOUyOe6qNVFSc1aiFjnETDAF1ETOFfg0Iy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wNdeVGLS; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wNdeVGLS"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6b2249bf2d0so16401267b3.2
        for <linux-coco@lists.linux.dev>; Thu, 29 Aug 2024 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724943018; x=1725547818; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K40x/XxYGu996xFAIHnF019vu74x3oRUZW/VL978XPs=;
        b=wNdeVGLS+pMqyU4Wj8ACrxDbhozeefWgh2u9FMgG9b7+XyCOaXBMHxCvZoUo+Xr7m4
         Dxgizyv905z04gWu95ieQLXgKb26mYxPFcHi2s2qYy7slDo3oEZex2U1Dfj02PkHk87w
         dxDG3tf83LbwWhHe5Ea770M4zPK97F7FXtmYl6eZtSeWLiEu3Cd9r2YjCiZhxUGsrIF2
         UoUHhfzDQUV+1F6GDSTZ2kgg7UlbPDweBUsOtbB0jEaLMCCUT+OLWjmjca8qn6dYo/H4
         VKaONQuqHrOfj2CnamvEd6HEei7V2J16xxuQNBAxl2NKJ6wHh1rYO6ngWayxW/l5ZIc3
         /Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724943018; x=1725547818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K40x/XxYGu996xFAIHnF019vu74x3oRUZW/VL978XPs=;
        b=DqICci9v9VCMG1v0KxmhL5VHHVtxy16cwCQDGD5idZbM8Yt4BHTz2PoxMjkybeV7a1
         bnm0+iPIGKRIsScgShFLb6RAm1xyG4/Apbd9q/RDp9/RM6qNVq08CAzyOu8dOLQ8N+5C
         NAoUuNuybracnEqIDbBgd8ohcfxTBSalqOtQll4mpf3mRhM3eAHtsqBNWmNBIUbbhg2g
         Xq6Tt7opjdGbd0wimjT6sTlVJDSIJ4IO951prOt/eg5C66A1UsRO4Wg/z2GPkJ/gBRgs
         NkuBlSJWkYZ7uAQPb9wiMCesdDqp2jgaudd+jgv9mY88gpxV0FGQK7kaEwryoFWKEzQh
         0dCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGNPSE+/Z94tkfEfpr0hX3cZeiqGdiq+CUi7dryGcHt7i9wSbub83TCFjO3ARop4pv/56/SYVG8ayS@lists.linux.dev
X-Gm-Message-State: AOJu0YxRt7Mgl32wQ9O/Xq7YVOJPO2GL4XdmGQdAf7NMJRsAwAANddon
	vLlFfnakHum1T6Cf8lpkMG77pcsKd1K92+Ktu1ZYR4tdb68So44eP1Fdd0b5cNbwpZlBZXGMfBr
	czg==
X-Google-Smtp-Source: AGHT+IGmzsl+rb2EC+zOzjzhADg2nn9Mafe2WTKumDpKYR0ktqk4W9+2ZAHTw7zGoStxNYtfttKBQBxzE5Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:680d:b0:64a:e220:bfb5 with SMTP id
 00721157ae682-6d2e6f71327mr398347b3.1.1724943018336; Thu, 29 Aug 2024
 07:50:18 -0700 (PDT)
Date: Thu, 29 Aug 2024 07:50:16 -0700
In-Reply-To: <87475131-856C-44DC-A27A-84648294F094@alien8.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240827203804.4989-1-Ashish.Kalra@amd.com> <87475131-856C-44DC-A27A-84648294F094@alien8.de>
Message-ID: <ZtCKqD_gc6wnqu-P@google.com>
Subject: Re: [PATCH] x86/sev: Fix host kdump support for SNP
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Ashish Kalra <Ashish.Kalra@amd.com>, pbonzini@redhat.com, dave.hansen@linux.intel.com, 
	tglx@linutronix.de, mingo@redhat.com, x86@kernel.org, hpa@zytor.com, 
	peterz@infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	thomas.lendacky@amd.com, michael.roth@amd.com, kexec@lists.infradead.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 29, 2024, Borislav Petkov wrote:
> On August 27, 2024 10:38:04 PM GMT+02:00, Ashish Kalra <Ashish.Kalra@amd.com> wrote:
> >From: Ashish Kalra <ashish.kalra@amd.com>
> >
> >With active SNP VMs, SNP_SHUTDOWN_EX invoked during panic notifiers causes
> >crashkernel boot failure with the following signature:
> 
> Why would SNP_SHUTDOWN be allowed *at all* if there are active SNP guests and
> there's potential to lose guest data in the process?!

Because if the host is panicking, guests are hosed regardless.  Unless I'm
misreading things, the goal here is to ensure the crashkernel can actually capture
a kdump.
