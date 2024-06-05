Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F22261694
	for <linux-coco@lists.linux.dev>; Wed,  5 Jun 2024 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717554488; cv=none; b=oIqv6u0/TOk/EpJoV/BrNN3X0uPkP78rFecGfX789lX9jJXkzLcwtZUZw0ERdv5HP7/7nztLs/zHVNo1MLF63HmZ90JYcVQaD/IOi+7sX+RHdLUJ+X7tHnrSoGvsUuHy3OOgT/q9teSEnPfPMJSryfVhIYDuNF3qxo3j7wwt6FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717554488; c=relaxed/simple;
	bh=R0Q+d0KNdIo4/1UDPQUotxY23fZjm0IKelJnw2zPQ2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r55bImtiM/JVCdXJELEiN5nDRZndXnFQcOGn+7gKTaR8zHdYoftLq4KqlG2E2JWhS3UWTjQptnP0tqyqsmkDNbSeFlzrNLm6J6gHDyUa9ICvn6CtZFrWkIoaXRJ3RXIv/UUNVzFPY2SLoDF3iuKW/zWIOB+hLIx3XGau+vEBgjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bKIMh9zk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bKIMh9zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717554486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lOA1MCZJzoxt6GCkNRp4+h7p2tW8g2r7m2il3+oTwSQ=;
	b=bKIMh9zkliGGhF7Lnm6bIOcsU80w6fnb1BsSHV1//kdxXTzhNDtuc4Z2bGF7sGpXVk8PFn
	Xru0XseEGuz7elxV42nAykDWmP8RY3YieT+/+oS9Vp4BCk4wXmLKHMbO+wc+H4JK1W0KGS
	U68xn4h955UoxuieRn3B635lC5GLzBw=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-v6bIWoHCMSuJaeZjhoR-vw-1; Tue, 04 Jun 2024 22:28:01 -0400
X-MC-Unique: v6bIWoHCMSuJaeZjhoR-vw-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3748a9f55ebso6470045ab.3
        for <linux-coco@lists.linux.dev>; Tue, 04 Jun 2024 19:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717554480; x=1718159280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOA1MCZJzoxt6GCkNRp4+h7p2tW8g2r7m2il3+oTwSQ=;
        b=a5WLs5RzF9hoXGHR3eYGk1wCmzTTGwgC3njju43SnuQCm506/jComSsadwOYq33Mb8
         KYoBSzie7+NbkA0LF4i2BruzEEuy9hL/tUoJ7YZiOUZ2ZvPJUJLwo3uf/26odM1Qpl1W
         FUTTELJ+DZKigzXjweHei0FlDU5/njA2RUsTi92OhNKqNVTcS62WqDoqbJNRer9pa6LJ
         r1HfyZjhG0w/giVDrpOvj6EEVdeznbBPbgo5vTEjBGZVmw2GyyoOOX9iryGF/KlXCEvn
         RbsPgaCmfp+mCowZNaHQkz/pNCJ2n7JJwKoTgmBp0EsY4Kvc4CP3V8X2ySop+WIDX90h
         vYng==
X-Forwarded-Encrypted: i=1; AJvYcCWeMMSqk2R73V5+zf+Npwhv9h/D2P+5yShxDtu90I7svNNxZ7NbCTl7+bnybUZAlN6oE4vsIKUd9sWoVut8bOZvGXLObRApsbsavA==
X-Gm-Message-State: AOJu0YywGOjHTdmTM/Sv2b9PSxlU5fhiUBmU7TWZZVGKpwDkXxPTgPVA
	iqIqyIXPkjAA3w6cQSODTPv0j0RviEIEPZ+9lPD2wg3rovcPH/QDngesDmZ/J0K0DMZsjoxRxzU
	YrPBThuCtgodg2LLoPZfh+D8HUkTpI3e5VMCORBQeipYYJRpu6nJmWPwlMNdFpc8iv+pzOwN8zs
	sA2rW/4+dtwJBhvw1HKeN3RPiFPKGx0PfxPA==
X-Received: by 2002:a05:6e02:2186:b0:374:9916:67 with SMTP id e9e14a558f8ab-374b1f581b2mr11523845ab.3.1717554480553;
        Tue, 04 Jun 2024 19:28:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLK8Z8K1Sf1VYEaO2jfZNFyTUIy/6PgZmMDleVpuyW8h0jbW5z86MOXD9UJxh2ksU0GUTW5kdRKx56WX70gCg=
X-Received: by 2002:a05:6e02:2186:b0:374:9916:67 with SMTP id
 e9e14a558f8ab-374b1f581b2mr11523595ab.3.1717554480186; Tue, 04 Jun 2024
 19:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f4be03b8488665f56a1e5c6e6459f447352dfcf5.1717111180.git.ashish.kalra@amd.com>
 <20240603085654.GBZl2FVjPd-gagt-UA@fat_crate.local> <8e3dfc15-f609-4839-85c7-1cc8cefd7acc@amd.com>
 <Zl3HfiQ6oHdTdOdA@kernel.org> <1ef36309-8d7f-447b-a54a-3cdafeccca64@amd.com>
 <20240603144639.GCZl3XTwmFHwi-KUZW@fat_crate.local> <Zl3hwYL2GDiyUfGo@kernel.org>
 <7eb4ca99-679c-4f23-9562-a39b966c28a0@amd.com> <20240603165747.GGZl32C9yrmXJ4nhPT@fat_crate.local>
 <2343889c-887a-49ce-86df-343737d70d37@amd.com> <20240603171231.GJZl35f-BHvU2Pk3lb@fat_crate.local>
 <ff28e3ea-c492-4db6-8781-abaec6320756@amd.com> <CALu+AoQBXv-y43sx6E28UBVeVHUzRkWEzFxK6jsS5NpN2ho3YQ@mail.gmail.com>
 <CALu+AoTY2Xxs_vUzCyfsxtk-ov2mzJhzyTbbA9MYeeVkmKTMsw@mail.gmail.com>
 <CALu+AoSESmasAHqWdCGgQNbsTXfwbfhERBkaqSeaX881zqKtFg@mail.gmail.com> <41e085b8-2b45-40ab-9a6f-f4ad975a0b06@amd.com>
In-Reply-To: <41e085b8-2b45-40ab-9a6f-f4ad975a0b06@amd.com>
From: Dave Young <dyoung@redhat.com>
Date: Wed, 5 Jun 2024 10:28:18 +0800
Message-ID: <CALu+AoQ2jNjb+5MZfFtpT_Y=2gJRWwqEeWTpQkwNt0-U5fpO_w@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] efi/x86: Fix EFI memory map corruption with kexec
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Mike Rapoport <rppt@kernel.org>, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, rafael@kernel.org, hpa@zytor.com, 
	peterz@infradead.org, adrian.hunter@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, jun.nakajima@intel.com, 
	rick.p.edgecombe@intel.com, thomas.lendacky@amd.com, michael.roth@amd.com, 
	seanjc@google.com, kai.huang@intel.com, bhe@redhat.com, 
	kirill.shutemov@linux.intel.com, bdas@redhat.com, vkuznets@redhat.com, 
	dionnaglaze@google.com, anisinha@redhat.com, jroedel@suse.de, ardb@kernel.org, 
	kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dan.j.williams@intel.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jun 2024 at 10:09, Kalra, Ashish <ashish.kalra@amd.com> wrote:
>
> Hello Dave,
>
> On 6/4/2024 8:58 PM, Dave Young wrote:
> > On Wed, 5 Jun 2024 at 09:52, Dave Young <dyoung@redhat.com> wrote:
> >>>>         ...
> >>>>         if (efi.memmap.flags & (EFI_MEMMAP_MEMBLOCK | EFI_MEMMAP_SLAB)) {
> >>>>                 __efi_memmap_free(efi.memmap.phys_map,
> >>>>                                 efi.memmap.desc_size * efi.memmap.nr_map, efi.memmap.flags);
> >>>>         }
> >>> From your debugging the memmap should not be freed.  This piece of
> >>> code was added in below commit,  added Dan Williams in cc list:
> >>> commit f0ef6523475f18ccd213e22ee593dfd131a2c5ea
> >>> Author: Dan Williams <dan.j.williams@intel.com>
> >>> Date:   Mon Jan 13 18:22:44 2020 +0100
> >>>
> >>>     efi: Fix efi_memmap_alloc() leaks
> >>>
> >>>     With efi_fake_memmap() and efi_arch_mem_reserve() the efi table may be
> >>>     updated and replaced multiple times. When that happens a previous
> >>>     dynamically allocated efi memory map can be garbage collected. Use the
> >>>     new EFI_MEMMAP_{SLAB,MEMBLOCK} flags to detect when a dynamically
> >>>     allocated memory map is being replaced.
> >>>
> >> Dan, probably those regions should be freed only for "fake" memmap?
> > Ashish, can you comment out the __efi_memmap_free see if it works for
> > you just confirm about the behavior.
>
> Yes, i have already tried and tested that, if i avoid __efi_memmap_free(), then i don't see this memory map corruption.

Ok, thanks!  I think the right way is creating two patches,  one to
remove the __efi_memmap_free, another is  skip efi_arch_mem_reserve
when the EFI_MEMORY_RUNTIME bit was set already.  But the first one
should be the fix for the root cause.

efi fake mem is only for debugging purposes,  the "memleak" mentioned
in commit 0f96a99dab36 should be solved in another way if needed (are
they really leaked? or just not useful anymore)

Anyway this is my opinion, please wait for x86 and efi reviewer's inputs.

>
> Thanks, Ashish
>

