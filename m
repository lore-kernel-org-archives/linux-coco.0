Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A2147C8E
	for <linux-coco@lists.linux.dev>; Wed,  3 Apr 2024 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712148738; cv=none; b=f3KCnob24UQ+2puJrDMlNjfybs3oZKfYUJgDs7fLWmOz1Hzewtuh4nsd7rDGi8wXNZzb79qZqVR+CQUmFcC5Akn/2xwVs4eefuU2JUn8JgUJk5VHp5kUlVyfFkVAgEpahSQ7NW2rZf0CBWMVKmomFqdOzyg3bwAEpxAABz2lSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712148738; c=relaxed/simple;
	bh=KTbI/ksSemO199S8nZZfV3jPhmS7kS2sBWwVojZaqVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYX2ZO5vpq4/4X5DfJL5uIZZtfflsTqrlhHOIW3KOG+rOaXoPbezfDM9fS0SREFIHRquL3r0vDbocQwH4CPcLAWtGNiX28jrX9iNHND1dQ8rNlL6pzCF80IEpht6RmQCzkV3R5BtUOWA498J4vs2m4hPPxDTh/17Uq3LXwxZpnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R1uATYUA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R1uATYUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712148735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lzo04337+pWNqFR9KY5np7872oqctqWVTvayomhrVIY=;
	b=R1uATYUA4ggZ7o57HmejgazGydMQqrOhLAogWxV9VLIPXHzT5jZ6huaOOhjOtULG4uYXi3
	Hml9yLdtEpkBkDYxWuxBmef8sVhIkTEfeE8Pc3K0NeS+lF6Ef6XgCRc0ODDSSlDyioS4iC
	be2DDKCT6N9CTqkfqjCES5AZTDW5gTo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-iLbaamH-P-WeK2Xo2EX4Ww-1; Wed, 03 Apr 2024 08:52:13 -0400
X-MC-Unique: iLbaamH-P-WeK2Xo2EX4Ww-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3436714e286so1193186f8f.0
        for <linux-coco@lists.linux.dev>; Wed, 03 Apr 2024 05:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712148732; x=1712753532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lzo04337+pWNqFR9KY5np7872oqctqWVTvayomhrVIY=;
        b=exfiXNO6DDi6mldVM8u4IY5/ex/nUt3TD7UY1iRkNK1x/xUGyD9t+k2QR19bKMcdE9
         +zVA85sXwvezAb0LikiA7JgG3vNTQH2UNhnFMbdwlzM/LOixT5fgLytSgSAnwFKeaBIS
         b6juWuS9cBLtOzhSXEh4zIJ+EM0MKxQAoSUyvgIQY+CoR06hfUNUbkM6zZt3t4e9W81U
         Y5RX+WBKegVBTu0nT3UaFAYZgZk0MOWyq7JkZJUMtKlrvhrbYYChEUcm6iKpJMRn0y2v
         2XKEUBNoUEJPK8RNKVfOPo0KOMeVpL30TE26xZfy+TtAmN6wH6VPWd0nYWAwUhE6gDpG
         Xgtw==
X-Forwarded-Encrypted: i=1; AJvYcCUccbiSAgg8iztoZuHxSRZuPJlgXz601TRKiH/tgh3KnB0lQc64I1QCK9MkNVE1jDFZ43tlklLf41iczQ8m1EgiDnX8DkOzPBNUvg==
X-Gm-Message-State: AOJu0YytJ1uGdjY9/G0D6L6Mc43wEJ4UBZlDmF0Qiq6ttdVa8Mz1xHnc
	ITr0MJMHLGYgv2UWuY1oZX7F2kIxLG2665lTDgCZG5a2gmp6562n/e1A9Ap9rWa5z4jKD1y2Cr8
	Vq1aZCUv48A+CRKxlktujhaHG7xDj3fw5svLXF/g/H1zKKmQT4EfOF0lJ6xQAym7ngBXTiL1DkW
	gQTAmJsX0wzexduegj3W8LYDmDjJ8NrlMruw==
X-Received: by 2002:a5d:48cc:0:b0:33e:ca29:5a3 with SMTP id p12-20020a5d48cc000000b0033eca2905a3mr10071641wrs.23.1712148731982;
        Wed, 03 Apr 2024 05:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2UoNabPuQYMXaCFPaD8DdCLeElDGS9RU+nviM9wFLu/qKDV0J6kv+wy2lYCLkobeqVDalIcJhUKiwuGQdPuY=
X-Received: by 2002:a5d:48cc:0:b0:33e:ca29:5a3 with SMTP id
 p12-20020a5d48cc000000b0033eca2905a3mr10071597wrs.23.1712148731603; Wed, 03
 Apr 2024 05:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329225835.400662-1-michael.roth@amd.com> <20240329225835.400662-12-michael.roth@amd.com>
 <8c3685a6-833c-4b3c-83f4-c0bd78bba36e@redhat.com> <20240401222229.qpnpozdsr6b2sntk@amd.com>
 <20240402225840.GB2444378@ls.amr.corp.intel.com>
In-Reply-To: <20240402225840.GB2444378@ls.amr.corp.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 3 Apr 2024 14:51:59 +0200
Message-ID: <CABgObfb4fQpUTzhpX9Bkcu0_+bOcCSCtuy+5-rttTLm-bY8i2w@mail.gmail.com>
Subject: Re: [PATCH v12 11/29] KVM: SEV: Add KVM_SEV_SNP_LAUNCH_UPDATE command
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	seanjc@google.com, vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	isaku.yamahata@linux.intel.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 12:58=E2=80=AFAM Isaku Yamahata <isaku.yamahata@inte=
l.com> wrote:
> I think TDX can use it with slight change. Pass vcpu instead of KVM, page=
 pin
> down and mmu_lock.  TDX requires non-leaf Secure page tables to be popula=
ted
> before adding a leaf.  Maybe with the assumption that vcpu doesn't run, G=
FN->PFN
> relation is stable so that mmu_lock isn't needed? What about punch hole?
>
> The flow would be something like as follows.
>
> - lock slots_lock
>
> - kvm_gmem_populate(vcpu)
>   - pin down source page instead of do_memcopy.

Both pinning the source page and the memcpy can be done in the
callback.  I think the right thing to do is:

1) eliminate do_memcpy, letting AMD code taking care of
   copy_from_user.

2) pass to the callback only gfn/pfn/src, where src is computed as

    args->src ? args->src + i * PAGE_SIZE : NULL

If another architecture/vendor needs do_memcpy, they can add
something like kvm_gmem_populate_copy.

>   - get pfn with __kvm_gmem_get_pfn()
>   - read lock mmu_lock
>   - in the post_populate callback
>     - lookup tdp mmu page table to check if the table is populated.
>       lookup only version of kvm_tdp_mmu_map().
>       We need vcpu instead of kvm.

Passing vcpu can be done using the opaque callback argument to
kvm_gmem_populate.

Likewise, the mmu_lock can be taken by the TDX post_populate
callback.

Paolo

>     - TDH_MEM_PAGE_ADD
>   - read unlock mmu_lock
>
> - unlock slots_lock
>
> Thanks,
>
> > With that model, the potential for using kvm_gmem_populate() seemed
> > plausible to I was trying to make it immediately usable for that
> > purpose. But maybe the TDX folks can confirm whether this would be
> > usable for them or not. (kvm_gmem_populate was introduced here[2] for
> > reference/background)
> >
> > -Mike
> >
> > [1] https://lore.kernel.org/kvm/20240319155349.GE1645738@ls.amr.corp.in=
tel.com/T/#m8580d8e39476be565534d6ff5f5afa295fe8d4f7
> > [2] https://lore.kernel.org/kvm/20240329212444.395559-3-michael.roth@am=
d.com/T/#m3aeba660fcc991602820d3703b1265722b871025)

