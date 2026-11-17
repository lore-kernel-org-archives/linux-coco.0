Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944281;
	b=03tFAffejQUO/tGK/kTInkfM4bKSPG0TlFfVg00/0GY0OqWSODdb/nLarkb+QqigoiCq
	 E3sC8EGTqFNJlUlOzLpkZDvATEF4MImjPqMxIXXP/UGvob0iW1+IBzK7Izlx3S4qVMEQW
	 xdmAW238o/kAbCByiKXHpD38/Pt3OsRtQ9Sabxr0AJ7tSNi19nTik3MDNzU7zQ0kSBuE7
	 O5serjEQuvGCc/iXkAh/lJj5x2GF9gHtVRTBcEgb2GSHazbKzeSxmlkqgu0p6aUnz5+3P
	 m9ksPiyfl5aNNv1wX+19WwXJTl/nRXKAsyPbKo4/g7xGsu0UcNgeqm91zD5UYbDtSfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=5/vHAZGe7S9PuEhTy7BQu6tAJsTjB19cuWDO6dDg/VA=;
	b=SsFS7dWCgQhe4k5dEIy0GjFrVKnnIQbQ/Vnw+ilRJOTTB9sq6rBueEBf2dfIZf1T54ab
	 jfotryA8vEBH9j/T3Q7A4zuGncTZz0jK+y4yOts01qtQ8NZsNO9tmw37sqZ+DvcdPwhxZ
	 yYGC1kflfp7GKgcd0gueaJd+7bRoWMjB8mpIMe25+8Xo5ku3YM4i0V2mpZEHesJugxuXO
	 Y36ev6ieASAXURXwps+qDKV0gZgvPuQ7SYtHUw+Kcd3GpD6J8Qi0qqxIMdx9W4b5ZgX6H
	 YITPEqQBfSxw2V+n+YuJJb97pC0Isrd0D56d9khiU2cwqu1SCTEnSnCH8OrKw7oJVDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dN3tSwil;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF77A606A33F
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 19:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF77A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dN3tSwil
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed02a00b24so965645ad.2
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 11:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794944280; x=1795549080; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/vHAZGe7S9PuEhTy7BQu6tAJsTjB19cuWDO6dDg/VA=;
        b=dN3tSwil5jrWf5pL2f4jJ1qTrHbjHoPk1LQTfCN1YpsHni1NJ958NDtSji/wlZgQgC
         DRRiAAtnElaND2rYXsdICcWvsbuayuaW3yESlNHJbf53xmQMzAt+NasAtE7+NGX8u1oL
         oHgwGLa2sDuZDDzN45hJNhQ5LPddKKGarUtjFAWc4UosCTEEpLQe6yxPYTmYPcmC92eD
         UMAjQOwt2bZ9hLTPc98rNyrhfifC3KkJbAoXWCUv5jbyVXmsyAgp9o1+ISS23mAgFr+L
         ZL6iLPooyJmSPCSJcgXCemGEmyVaZWEtU2w9HYwQWWcEhJnjeEtVt5Dzs5FHRs/w7NoA
         xFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944280; x=1795549080;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/vHAZGe7S9PuEhTy7BQu6tAJsTjB19cuWDO6dDg/VA=;
        b=nCPM9TWB/ascBs4uI5OmtaXB6Q7BcjFT9E1L1jriKA0tPufARkjHEQxVKwFPHokOGA
         L0RvDy2raEDtyVo+4Zf0ThGF0Z78BI7vmC8fSWa3TiVRRNFECOB9GL3rySwQhGsNlrjj
         MfLCdYnqiczB78+eBsu7eWz8FVHHu/8dxcb7aPNFqITiDlwAtP2bW0jlIRXl8FNaojGy
         rYz8VnuTKrUpZOU5AJ6v5cC6QI8XLeD+71QqkM9K+WeNUmI3Ep/JlpFU/H8c/3vCF7rr
         exfG8uEGQvAzuKnprm9OiW9z3R8pdmGKbZIyxXZN2pI3rGzRk7kraQCu8UB0qchoqXnP
         4j3A==
X-Forwarded-Encrypted: i=1; AL+hErF5YusKJnJOcJYffvKC0Ng+8nYvqSDdOeZlKk17EGCTwkDhyd3+i04p22yKHK2mEPxR++ElvaxKtOYQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8sUrhODejjG3Xi/Xz5kTW+UbVfm313Zbi7E+N892X4oC3ZEcQF
	AzRDzrNO13rArThWV55AtFvKpOPnDA60GKBY7fJ8gseE6pVwkWytjrCSXFNIUnrWLABwK01Ra1c
	R2fr8uA==
X-Received: from ploh2.prod.google.com ([2002:a17:902:f702:b0:2e3:1b6e:33bb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f64e:b0:2ed:12a1:c4a9
 with SMTP id d9443c01a7336-2eff752924cmr3212835ad.11.1794944279883; Tue, 17
 Nov 2026 11:37:59 -0800 (PST)
Date: Tue, 17 Nov 2026 11:37:59 -0800
In-Reply-To: <20261117190714.GAavyl4lS15Gwpc29U@fat_crate.local>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117190041.158949-1-nik.borisov@suse.com> <20261117190714.GAavyl4lS15Gwpc29U@fat_crate.local>
Message-ID: <avytF4CYn5FUkA4F@seanjc-mac.roam.internal>
Subject: Re: [PATCH] x86/virt/tdx: Don't print error if CPU doesn't support TDX
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Nikolay Borisov <nik.borisov@suse.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 17, 2026, Borislav Petkov wrote:
> On Tue, Nov 17, 2026 at 09:00:41PM +0200, Nikolay Borisov wrote:
> > There's still plenty of Intel CPUs which do not support TDX and when a
> > recent kernel is booted on those the user always sees the following
> > error:
> > 
> > 	virt/tdx TDX not supported by hostplatform.
> > 
> > The same is also printed on all AMD CPUs. Fix by using pr_info.
> > 
> > Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> > ---
> > 
> > Contrary to Pet Shop Boy's song - it's not a sin to not support TDX, yet :)
> > 
> >  arch/x86/virt/vmx/tdx/tdx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> > index 96ced0494b68..b2962da24701 100644
> > --- a/arch/x86/virt/vmx/tdx/tdx.c
> > +++ b/arch/x86/virt/vmx/tdx/tdx.c
> > @@ -1276,7 +1276,7 @@ static __init int tdx_enable(void)
> >  	int ret;
> >  
> >  	if (!cpu_feature_enabled(X86_FEATURE_TDX_HOST_PLATFORM)) {
> > -		pr_err("TDX not supported by the host platform\n");
> > +		pr_info("TDX not supported by the host platform\n");
> >  		return -ENODEV;
> >  	}
> >  
> > --
> 
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

FWIW, I prefer Jiri's version which just drops the printk entirely:

https://lore.kernel.org/all/27b6d824f7aee7078167944ce96d95676eee25cb.1793602266.git.jirislaby@kernel.org
