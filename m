Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A54221CF9A
	for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 19:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731440043; cv=none; b=tsSKMm/+XsXk1s6uDBeO+fgVeHIzYnisjALQ4nnTcpiTuMbm7cI9R0DdvFz/bsOC3IyLYFaww1SPiOaau0YWGJL/uq2qp1e7d2X12aia7pdSjI+ChV7EXz9v6m8sK0ziPFbZMgqT+7yRldUXONtik13+zgYusgX0/BHVRCpq2qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731440043; c=relaxed/simple;
	bh=8Zw9VxaGNKeAshrG2DVz/boJEgYN8+U9vCybtzTq3DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/6SBNanUif9xcxPEdDoa/jiZ2okJTOnnX2bVJb0IjonDpwAzGGIRfCEn8HH38CqIarwMGyA5AxQWiQMEI0+cCt7hkwnZ3oOHgwtKPqRA70CDhjZau7o0aN5Ydn+7P0793/lMnj3E4MQhdE6HvYx//CQTQ1xBaf7FUrgK474YUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uvHp8N2n; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uvHp8N2n"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso5685309f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 11:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731440040; x=1732044840; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y9wb6AkvqlKLFv6CsY4nbWvFqgC5HzXu2/jh/XKH3TM=;
        b=uvHp8N2nTSPpZwY+T5Szy5aOwb7N/ePtFAVoN9yZAU3tBj+ehKhB6uKGq1tLWN2NGz
         kiyRyMGVBmn7BNSDtsiVPCiFsUJiUvw7NUeTJcXYSxwenrkPPFPVq9VzxrBsO8Qt/bDI
         8003EJCsVY5t96XySoAyHXZsovJxbmDXsJAgkzuM4Ch6NZ4hQFUtf/X76bWaJfZurGKm
         UIsc+EaiV6n8nwfdIdJA1L0qCk83NORJun3IektiiBQERvd5QLt9P38ttGVa53UowWyJ
         O/HM1bt8SlYqGGrZ0FMETmbVR9PuNg+u25EUaN6i63Ejf5x9ftihprrUCypQ/AR45uJ9
         +MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731440040; x=1732044840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9wb6AkvqlKLFv6CsY4nbWvFqgC5HzXu2/jh/XKH3TM=;
        b=Wb/uv4sKQTc5uQujJSua0tpRIm1sXcSgPCUEsV6YTjjtpFKqTAzAXtivKD3PXzp6mR
         5gtrq9RM4LR1+CY63z6en0N8CiFURYaIOtlgpwoJs66uUMYMlvpvvr4iVM9+S6SVLLJu
         JRUZZZCPImVDUyWpseurKm8dXjTPkRfhBG6zp1cUhscfzwdTZ2BA3SVIDGKiznheO2V2
         I0iVwp6eaF+t8F6TrstmVD3A5iAGfcotZ+1VEilAPGuH/99zd62N10fet9uhlk8Sw4GS
         YX8HmrGu3xINOnWrt7Upr9e4KPT/262VFla+/FmjMtOB5BDQPXkOfOiNsbKXE0zLEk16
         bZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuDe3iLBSGX7C/Y7uoSsZ3HPX2w7hsVRRg5S5Q03/gxhd7JnnwQ/8kQBYI1Rfc60Tgw02smkGT/9Py@lists.linux.dev
X-Gm-Message-State: AOJu0YzHTq7e2A7ggZS1QKOgC5eBXoOzCCRCDBEp5XMJpgrLO/2Ym6W3
	Xx2VF0GeoPad3g40xTKsvyu9OWBOVHVXPOVgIPmzTSSmRL5EDRSdJ2iWq7vD8tctCfNcIKoNeI7
	Ign+M7SJ4N5UDLiZFNBOYx1ndvldpqHIrAgt3
X-Google-Smtp-Source: AGHT+IH2loZRrvGX7OLDNAn4wYJUo+4ZKUEg9FXqo8fn5IA6xVdWeodz/p2eUqUKInKsvo4Oso+ZqW477vo9YTiTm1Q=
X-Received: by 2002:a05:6000:2a8a:b0:381:f443:21d1 with SMTP id
 ffacd0b85a97d-381f443259dmr17589618f8f.54.1731440040288; Tue, 12 Nov 2024
 11:34:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107232457.4059785-1-dionnaglaze@google.com>
 <20241107232457.4059785-10-dionnaglaze@google.com> <43be0a16-0a06-d7fb-3925-4337fb38e9e9@amd.com>
In-Reply-To: <43be0a16-0a06-d7fb-3925-4337fb38e9e9@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 12 Nov 2024 11:33:48 -0800
Message-ID: <CAAH4kHasdYwboG+zgR=MaTRBKyNmwpvBQ-ChRY18=EiBBSdFXQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] KVM: SVM: Use new ccp GCTX API
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, 
	Ashish Kalra <ashish.kalra@amd.com>, John Allen <john.allen@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Michael Roth <michael.roth@amd.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tianfei zhang <tianfei.zhang@intel.com>, Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index cea41b8cdabe4..d7cef84750b33 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -89,7 +89,7 @@ static unsigned int nr_asids;
> >  static unsigned long *sev_asid_bitmap;
> >  static unsigned long *sev_reclaim_asid_bitmap;
> >
> > -static int snp_decommission_context(struct kvm *kvm);
> > +static int kvm_decommission_snp_context(struct kvm *kvm);
>
> Why the name change? It seems like it just makes the patch a bit harder
> to follow since there are two things going on.
>

KVM and ccp both seem to like to name their functions starting with
sev_ or snp_, and it's particularly hard to determine provenance.

snp_decommision_context and sev_snp_guest_decommission... which is
from where? It's weird to me.

> Thanks,
> Tom
>


-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
