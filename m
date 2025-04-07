Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF61A3142
	for <linux-coco@lists.linux.dev>; Mon,  7 Apr 2025 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012416; cv=none; b=Axv2hJ+Wttz6pmTPkuv7OLhCRu4ri0Q0tGROAhzgxwzQkzhqHvzwrXb+0qW+MZMIoSKYI5VuZUCi1ZxWhfv2YhyDKyahCae8G/5X/7wijm6gm/3NEWeKhbxeRcOUXHj1ny4zLzu+qAmGotehFQ2alVkB03zc6Lw/D+OLh9cH9Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012416; c=relaxed/simple;
	bh=szwnXOzOSOjBOch3SoWaXXjO3Tlak50jw4MvIJHciKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKqp4dyFkNPHCQw/RgFp6BkXNhhlwQiI9HzGozjDU36z1+Qa+vAv+f3o0vAuYmiinTYxUyqM4alYUSgLOK9PC7DzRZ4rDjRPcGb/eKuu3NZ3ybwIpYFyLKyaP0qZiNjgJUrVks+1bCklbbwIt5HNNYf1b81QSPIb8S0FyXXk9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cR+pUM6H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cR+pUM6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744012413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ofsy77ssOrCPdPnwbpfIBh3i6M18rOr/4yXwZKj56Wg=;
	b=cR+pUM6HeWMGVjFD1D4ejMnFYVnTbv5Cr03Qzgoe1x93oHiSSE98BasfZ6RKUd0An8jXgq
	aiOrBcLP+egyr7+swJ6gpCAU1ZD4LDrNQSrMH5lqU4riwddJ3qsrYlFvcZBYf5+LvP7ZKO
	xWs10QDbjTq7mkDqjHQUQ4L7ZCjr/0Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-In1vmYm2MfeD_k4o1sgwOg-1; Mon, 07 Apr 2025 03:53:32 -0400
X-MC-Unique: In1vmYm2MfeD_k4o1sgwOg-1
X-Mimecast-MFC-AGG-ID: In1vmYm2MfeD_k4o1sgwOg_1744012411
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39126c3469fso1547907f8f.3
        for <linux-coco@lists.linux.dev>; Mon, 07 Apr 2025 00:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012411; x=1744617211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ofsy77ssOrCPdPnwbpfIBh3i6M18rOr/4yXwZKj56Wg=;
        b=q9XBmAG65t1grQ0Y5KPNHHw7GIZgB+QyTEZ3qA4DIJQObOPJS3foWBSpAcEOG4K1aN
         PxAR6qwuW1gzoCFwUrX1K2eIG4H1Z/I3B+pEIg3Z3jERf4n/rmNeJfIiZLi5ro3FfLR6
         FOsrTWvj2GgOnBtDrvLX8zGZwb3f2FV1RKJLY5tLMha5Z/+ydMAmD4k39mCGPzglgJJV
         aiSKggOs5S0DdRirzYmO7EqKzPoeKNkJ44FPtDhEeU4pHUR4PoUWrFa/APHPuZ6TluO1
         nLKjwMtj8Ti9v+3orhhhwZJwWz3fPqLSDtoHUP3rwNFfIEGYsae3iPc3Bll1ZsmBiz5g
         8Vgg==
X-Forwarded-Encrypted: i=1; AJvYcCXhpez6pWiUxlvMuuIGNOpP1X7kxVKXur6DRsC6JR0K+x76jezEiCrJfLf8QDZk6dPFqxZ7esWTzMHD@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2htFxJHf4suESvMfVwQwsnZJvpeivsBrJP7Jco57ylqnMu/7Q
	lq+ssC5vBjgzIHjtIsxHG22sNMCl94wvDPQ/Z/xPd8FT1xCumGkiqjSDe7/eR29v8tF3loLIXbc
	YALt4a1+gi82bWqHJEOybDdzziXuQ+UJ1MRd+6tCXTQWvUKbccOg4k1sej0b5L7ZRJsUfEYzYB9
	dDyzXMORIyV4agm9Nss5vDGAQmNaLucU5f/Q==
X-Gm-Gg: ASbGncsa9dECNPeCRudRWcQVJhYYyNd//J4wkYCQBhM+7rzH6SjSk1fJNIRgP9q21yI
	P0IShSxfKj7cLoGjts15ItdaND4uDVxfXwcLD1KT5DPrisIwFsSUI2G0vqYTnweX+LqcZ3qo=
X-Received: by 2002:a5d:6d8b:0:b0:391:489a:ce12 with SMTP id ffacd0b85a97d-39cba9324c4mr9434688f8f.26.1744012411513;
        Mon, 07 Apr 2025 00:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEucAUDP41Wd19TJhxmtFTNd5L+/2tfINDx0SVCwJt1Ss7gnd+Nfa6ty3EOnVN7dms57jS4L4Bva0CX/NdTT8g=
X-Received: by 2002:a5d:6d8b:0:b0:391:489a:ce12 with SMTP id
 ffacd0b85a97d-39cba9324c4mr9434669f8f.26.1744012411222; Mon, 07 Apr 2025
 00:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1742850400.git.ashish.kalra@amd.com> <Z_NdKF3PllghT2XC@gondor.apana.org.au>
In-Reply-To: <Z_NdKF3PllghT2XC@gondor.apana.org.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 7 Apr 2025 09:53:19 +0200
X-Gm-Features: ATxdqUFovAPd1YyW8urz9uvodd5Msi-Jyl0y3VBXdc00kyPAkug_xTk1qmoKSKs
Message-ID: <CABgObfa=7DMCz99268Lamgn5g5h_sgDqkDoOSUAd5rG+seCe-g@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Move initializing SEV/SNP functionality to KVM
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ashish Kalra <Ashish.Kalra@amd.com>, seanjc@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	michael.roth@amd.com, dionnaglaze@google.com, nikunj@amd.com, ardb@kernel.org, 
	kevinloughlin@google.com, Neeraj.Upadhyay@amd.com, aik@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZktB0-YndbXJJ3H4EMOcMma66Pib_QwNCgV6u35tpsA_1744012411
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 7:06=E2=80=AFAM Herbert Xu <herbert@gondor.apana.org=
.au> wrote:
> > Ashish Kalra (8):
> >   crypto: ccp: Abort doing SEV INIT if SNP INIT fails
> >   crypto: ccp: Move dev_info/err messages for SEV/SNP init and shutdown
> >   crypto: ccp: Ensure implicit SEV/SNP init and shutdown in ioctls
> >   crypto: ccp: Reset TMR size at SNP Shutdown
> >   crypto: ccp: Register SNP panic notifier only if SNP is enabled
> >   crypto: ccp: Add new SEV/SNP platform shutdown API
> >   KVM: SVM: Add support to initialize SEV/SNP functionality in KVM
> >   crypto: ccp: Move SEV/SNP Platform initialization to KVM
> >
> >  arch/x86/kvm/svm/sev.c       |  12 ++
> >  drivers/crypto/ccp/sev-dev.c | 245 +++++++++++++++++++++++++----------
> >  include/linux/psp-sev.h      |   3 +
> >  3 files changed, 194 insertions(+), 66 deletions(-)
> >
> > --
> > 2.34.1
>
> Patches 1-6 applied.  Thanks.

Thanks, go ahead and apply 7-8 as well (or if you don't want to,
please provide a topic branch).

Paolo

