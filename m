Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BE6469856
	for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053137; cv=pass; b=SgtWit9AdPyFlR6U+f5qpeY1P1JLx2qvblqfCq6u6uOQXrc50++lQwy78hKu2kZuPOQXXPHCnBn3nZf4WGuvLvw2Tum6rKf4OQJk9moeeC7vOeoto+KkKXm4+LTSMXQy9cVnw72bicpuNsAxlRil6OTnMVUc5ytW9fPC9HacRfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053137; c=relaxed/simple;
	bh=R5o16+Omcz53a7Kx4ZfW7KXrNOIiI548XNd9wpNEOgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcTgAZCJIjS7QBWvUzg4tMZRMa92WJvH+Q0HMIS0PXrgkaFXwuyWjn4ksWolwcvZYO4TY3zvlCnalIZCBfIN1LoL/hlbP7mKKzv8TBZ85V3/bsLTqVZN5nQbfuT4Obi5dthjuBU3hFnPTHewY4svJT+X2jxxKy/y9096/rWcu+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=TTDhZumb; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="TTDhZumb"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52d7a3defe8so27648051cf.0
        for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 04:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787053133; cv=none;
        d=google.com; s=arc-20260327;
        b=YMF1Hj39vctfj5aazEAxDL+w7arZBjQrHokF5z/eS/5H6OyHcfbcgxTCKFbJ1Jb+8v
         uU9TVm5PzL31dWEZ/l7Z03bWbUWMrjTgerbURJYUSX/43+NRQ9NUINjKtO0VBX5ceS/N
         EsNqRgDRSqPlxIfKbOIyTVMU+L7MuAimBQVUZhVR8p82ePY78pS+A/u80chCYtMGJjQs
         mONMsAM35EfKsupoNPchXsPQxjbBXM/9ctMBntzNeY4oZs+BI+mqbi6PlZNLEO2cwyJe
         Pyx1ZwpNDEWrsUYxhg4c4ruWm9uSiAR3hJPbBtI/wU3Wp7luWYGW00oS+eC7LCY7xLS+
         wtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IKEkIrKVQR0ZN9IVyQ5hY25xXRDuaWv/xBwod1rhWEQ=;
        fh=8BHk9LyYJRCtIa0HsN5dBIOUokYOUpRpBUbc+/4ZEwI=;
        b=cDp7JUbmW5ItvQaZyCkbNcn0ruL3VO/Sk+JMBjPtl9L80nZML3McGARJncbqhduejS
         uEVO+91EsCzyetiPNXboVNXgZrIzOtxMvwGGXgcmVtWZKEp5P3J+G/gIoDNP5JdoPJOK
         tUMrvyJCe2jjOPUiaCwkO7ZswcfbNc8jgXQgpo/uOdN/jDeFmBEPe+MySuYL39Gaue/f
         lZL1dzWrMkC2HmZropBGvW7mmrp/pTRAtyu1h5lZH7L49AT2+HrANDc58r36+0sDsH1O
         6S5i3Eb2MeCf7G1dYPjrNr+QpQ3Ef/4Om4n9u1d0qxGW6VC0QDf8mhXs/IsuuYYoWnQL
         7EoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787053133; x=1787657933; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IKEkIrKVQR0ZN9IVyQ5hY25xXRDuaWv/xBwod1rhWEQ=;
        b=TTDhZumbt/3HPeZ8JBnr6hB+JPmpbU3kNRWvYaVHGSGO+kxl6BP1a5mMij9fblc6OO
         JNgdCGtu3lEGsQm2nlVhI5bkfSSoDqsRSkbIJKqgGmfI2LOf5u5+EI8MHqhD3//F+7A8
         ydReZImCIt5aC/++0/cAgAWk2tcwdZk4miyLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053133; x=1787657933;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IKEkIrKVQR0ZN9IVyQ5hY25xXRDuaWv/xBwod1rhWEQ=;
        b=SIgjWqZUmdq/rOxTK8Lo0g1+wQP3c+VscvkTx92sILb4vHhePcbVjOOvCi/sW3QbmM
         ih7LFiR+cBxF8guU6X0UR0fZMRB6OOpsFvWG6FvwfpL4bXcf8w9/ug3MAyVB/tcIinCK
         CHOdRiC7+RNOKLGxCuGxKYNIXWtDZyosA1d95eQG7wNKqIytVRuVYQFnRxh8DPDWOFb1
         msR0uUFAkSQNTY3pcStfu8Rhk4Y4gDUph+VkKZ1/Wi0jEpMiB9YNNuoDeLFFZoIFwUMP
         vFTEMfDbaMKVirVWhF45town7TTlGXs4GHKDqWmhSpdR3ou82K+ObMMTm4y4AcFEN6ol
         HswQ==
X-Forwarded-Encrypted: i=1; AHgh+RpA4J46x7M4+VYbyGxJhP+FILCRHOi8Kc04IXD+wwlf7Ku+wVvFTL5u6mQEOLGbWtPS5njNuEpF2wiz@lists.linux.dev
X-Gm-Message-State: AOJu0YxHT/3oDVH0fLSL7guMezFZzZ4/YI4gQgVj0stctFL+FIHK9JCs
	ySlBLZgIHkr19CALfpiS6H27mAbW4I58U1NelD3HrlQGWqjRAXmvOCjZEqkRYRkjhS4mNBAQGdp
	zDv5o7491Z0cyDASCPmUY7B0pD/7w1A0/RIdgCMieTA==
X-Gm-Gg: AR+sD10r41U+1GyIhYZRxh5pFoGWpWxobyoLHT8+FisN3TExDscb6MMlIO8bShNY7Mh
	6w/4mhNUeulWIh1GqpZ8uSDTe9l1gNFxFMARZpJQiZ6QgAdFz/5L4Jti3zKX5Go1FclXO9/gdHV
	+SNDKdMDQiWrH5r7Sv+SBCBaArvVyRgW7tl8kct8wJ5jTUajtHaf2deiTbIXNsFucUoYDtre3WO
	zTPM5uEZ1+xBK4INn4NWp7eA3ThWAezT1DkcktGEo5HPKWgBOpc6E+3mU4gp1DhONv8aziefe9O
	9FVEUirVCX+C5/8Kw47bDAEXsLEmmV4KPQQoQnONfj4IoUGdEkM3TuhpSXwLqaJNML3nvTWdxhl
	AVleau035ncI=
X-Received: by 2002:ac8:5d56:0:b0:52d:82bf:d4cf with SMTP id
 d75a77b69052e-52d85423d44mr330702361cf.16.1787053133550; Tue, 18 Aug 2026
 04:38:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727210718.125872-1-psalian@google.com>
In-Reply-To: <20260727210718.125872-1-psalian@google.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 13:38:42 +0200
X-Gm-Features: AcwNN1XewOXnh0aWSTVRImoi3l7UFUMEHcPRuIjYoS02ZE13JAWqCypgXDea8Go
Message-ID: <CAJfpegvtp3L3FuYd8v1Ox0nZ-fb632jy+_M_+YyBWpMQGJAXug@mail.gmail.com>
Subject: Re: [PATCH] fuse: mark DAX VMA page protections as decrypted
To: Punit Salian <psalian@google.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, linux-coco@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

[Cc:  Tom Lendacky + lists]

On Mon, 27 Jul 2026 at 23:07, Punit Salian <psalian@google.com> wrote:
>
> In confidential computing guest environments (such as AMD SEV-SNP or
> Intel TDX), direct memory access (DAX) mappings between the guest kernel
> and host-backed FUSE/virtiofs shared memory regions must be accessed
> using shared (decrypted) page protections.
>
> Modify fuse_dax_mmap() to apply pgprot_decrypted() to vma->vm_page_prot
> when establishing FUSE DAX memory mappings. This ensures guest page
> table entries for shared DAX buffers are explicitly marked as decrypted,
> preventing memory encryption faults when accessing host-shared DAX memory.
>
> Signed-off-by: Punit Salian <psalian@google.com>
> ---
>  fs/fuse/dax.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
> index a15c464c8d19..00e316a7f805 100644
> --- a/fs/fuse/dax.c
> +++ b/fs/fuse/dax.c
> @@ -826,6 +826,7 @@ int fuse_dax_mmap(struct file *file, struct vm_area_struct *vma)
>         file_accessed(file);
>         vma->vm_ops = &fuse_dax_vm_ops;
>         vm_flags_set(vma, VM_MIXEDMAP | VM_HUGEPAGE);
> +       vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>
>         return 0;
>  }
> --

Needs review from someone understanding this technology.

Thanks,
Miklos
