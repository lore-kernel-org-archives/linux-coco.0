Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16F030FC2E
	for <linux-coco@lists.linux.dev>; Wed,  1 Apr 2026 18:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775067127; cv=none; b=P/v2BpmLqal41unDL1z5OPKGTM5LJcwYKbW7mpX3V4g5xyILunRSEwIEQYKQrE0weaYCZuNGdCnrQXUc0QdmdZD7kGW85b4aLegga8o+thYI3dFi7dhLz4uaK5T9SDbj1VPOMUHprFuD8PHUDJQDAEojzERheXTEUCXjbFqfLXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775067127; c=relaxed/simple;
	bh=71II0EatvhljVaIL9l3M+R/q80RIz409yIhJNQPejPc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PYaVgEtbJOD+wwzVMOCOx5cEn7Y0TZnlal9lXRhCY8ob6qLlTo1vdCW8QQSjemxX5T5KZ8D6pntMfPO55XmQBNTs5UjtkGuFIyODXDcybmjijT3xzGfvsnHjZziG62zJyR4JphHpyvGPNBIin2Ooz6TlQYR8SKq1BZOi6YphsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B+e990KZ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+e990KZ"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso33098b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 01 Apr 2026 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775067126; x=1775671926; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AbEr00zbJN9l4OpkyONzYOWax76lpPtRnsktjJvjXs8=;
        b=B+e990KZGxsp3xjDyshTieMD3+R849mze4JZ2V4kumjVE5GVN5TS5ZFVvdiKGYb7X7
         6x/DUcjw3I9tcmjDCC5ti+jPk2lrO/cwKhbK1mfDFl6KzP1S1XXEFOVub2Ww+sfb1CrR
         N5BxkTF6qMxs1Npara1g7w3+TAlMPIUTSKFdmDCTrXhqEmHYY6wHJeId4UHeNK5n2pRS
         EHLlvsXkurZvvB9ITJUkK39NIVON/A/CDfqCVj1IhvedP9vfXzgdI+PN+fGoWVCZ/1Es
         lspPi3kmj13t2PRV7sMitUrhXdGAAvgcIHqLW9cmOGXH33ZBf1rQKqIugTZWTEbT3FEE
         x5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775067126; x=1775671926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbEr00zbJN9l4OpkyONzYOWax76lpPtRnsktjJvjXs8=;
        b=CvBSbjSgZS+D9MRPz0feOAM6IrXBYFmXqAH0euNgSTR2EPs1DHEDG1Iy88O6NB+XIg
         Bb9WqrnLIfNuuZ0j6zjieKSWVcbIzaZunyXUJtErDoFWdP2FD/ylJV4/zvB3pGH6Suc3
         cN9xDRdsnDhmPrOvYvgd515AvGFw4JCc0wZhEysHPjcm0WZVC3b7UqoNoq/qRBa2yPCD
         U6MhVKjVBJm6c3ZoV6/Vkp2NyvI+KUZU83FIcW41DECVBH8jckUVxJ49IUOlAwTKl8ax
         6LlAnBUR5qtZo6iXZWjm7vdPYwPx1UHrCbII6gbB3cgVIWgkVolVhVJqVHbcq8Y3mBYf
         K77Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMksmtDkeZ6VM49fD2sbBueB9m2zIfkaZbYa8EANrPME6KzYgGOTu0PGUD39RLGu7WP3ZAtb28afyR@lists.linux.dev
X-Gm-Message-State: AOJu0YwJuI4NgboJuaFSqVJxOy27tG6B81ldUwC5W5j6QShVL6a0OFVz
	O3OABlG8K6P2oe7n4jvPUbV2S8ncV7qPqPsu2zyI1wMCJkjfGlNbhNUhC8UQSHZJiIHRDeDsq57
	9sL7K9A==
X-Received: from pfbhh9.prod.google.com ([2002:a05:6a00:8689:b0:829:f706:70e4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3988:b0:82c:24d3:29d7
 with SMTP id d2e1a72fcca58-82ce88ead18mr5007330b3a.9.1775067125841; Wed, 01
 Apr 2026 11:12:05 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:12:04 -0700
In-Reply-To: <76F29857-47D8-470B-9F4D-DD98D8755EB0@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260323-fuller_tdx_kexec_support-v2-0-87a36409e051@intel.com>
 <20260323-fuller_tdx_kexec_support-v2-2-87a36409e051@intel.com>
 <acwe7kKyjfEQ0sIf@google.com> <6ad3ff51bbab85147b716de0b1f4e8b994b1998b.camel@intel.com>
 <acxTBwaw6_xYSShf@google.com> <830f1e46-0fb7-4756-827b-c8f46af24374@intel.com>
 <76F29857-47D8-470B-9F4D-DD98D8755EB0@zytor.com>
Message-ID: <ac1f9KntTv0SaktS@google.com>
Subject: Re: [PATCH v2 2/5] x86/virt/tdx: Pull kexec cache flush logic into arch/x86
From: Sean Christopherson <seanjc@google.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Vishal L Verma <vishal.l.verma@intel.com>, Kai Huang <kai.huang@intel.com>, 
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 01, 2026, H. Peter Anvin wrote:
> On April 1, 2026 8:03:02 AM PDT, Dave Hansen <dave.hansen@intel.com> wrote:
> >On 3/31/26 16:04, Sean Christopherson wrote:
> >> But unless the WBINVD is actually costly, why bother getting fancy?
> >
> >WBINVD might be the most expensive single instruction in the whole ISA.
> >
> >That said, I'd much rather have a potentially unnecessary WBINVD than
> >miss one. The thing I'd be worried about would be something wonky like:
> >
> >	1. CPU offline does WBINVD
> >	2. Some other TDX call gets made, dirties caches again
> >	3. tdx_offline_cpu() skips WBINVD
> >
> >So, let's just do both for now: Do WBINVD in tdx_offline_cpu() and
> >comment that it might be redundant with other things in the CPU offline
> >procedure.
> >
> >This really needs to be solved with infrastructure and keeping data
> >about the reasons for needing WBINVD, not relying on code ordering or
> >fragile semantics.
> 
> It is, *by far*, the most expensive *uninterruptible* instruction in the ISA.
> REP string instructions can of course be arbitrarily long, but are
> interruptible and so don't really count.
> 
> Some MSRs used during very early (pre-OS) initialization might be even slower
> on some implementations, but that's not visible to Linux and no workload of
> any kind is running.

Sorry, "costly" wasn't the right word.  I know WBINVD super expensive, but unless
someone cares deeply about the latency of offlining a CPU after its down TDX stuff,
the "cost" is effectively zero.
