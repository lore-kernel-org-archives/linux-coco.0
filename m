Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F01EA90
	for <linux-coco@lists.linux.dev>; Wed,  5 Jun 2024 01:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717552315; cv=none; b=jQTWGFyZKc0CZHfVVmSVBRz7N/ffUmdoqXFwp67uGxw2nhI3sqv4vm3R/4gt0lQrsbmaqgjNX562MTksZ3vfA1ESN6weg+Fd975MjerzGrC248JcetE5ujCCyMFgL8Dil3V1UagLmMnuVcjFK3Fjk/9zr+xkz11iRywg4LYUrtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717552315; c=relaxed/simple;
	bh=OmK2gI8hdD5XbePH08Wp+6onT/YKAAFKoajQb9RoVTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bz4jGJnlMDU29maifUvSXwVq/4E6QjPPXpwS7B+urYfU3xwKk+h2fHqgUGcUjrRzjj7zY4nUOQo4mG+OFKomKe8EN8veFsunfMd1U+EyZbxvrUOnNKeWcSY0z96rl6jqBoraUHeL9ptmEl/i5QlShbCbFusWDqbm0TwDchlyi3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+Lcyx/I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+Lcyx/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717552312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=upN2cK+0+gJo/KqGs9LW3KxpT5YmqhfYJXwjAOS8ygY=;
	b=a+Lcyx/I2P8p74c2D9o7b82KEv5XBRDqn2zMo8IkgjS1aYACQA+xPokIsRnN8Ccvo7/4Eq
	B7/u8+02ZKGacUCkCGucznqtZAmrCD5Dn+GREQg559oz3WmXVgMPwxCeEDMkwLNSEBOUuB
	AbVJNVgEggj3UsoffVGTzHhXwMLXXqo=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-OyHQ1XDJPzOQrzQSbGhwzQ-1; Tue, 04 Jun 2024 21:51:51 -0400
X-MC-Unique: OyHQ1XDJPzOQrzQSbGhwzQ-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3745776e1ecso8881645ab.2
        for <linux-coco@lists.linux.dev>; Tue, 04 Jun 2024 18:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717552311; x=1718157111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upN2cK+0+gJo/KqGs9LW3KxpT5YmqhfYJXwjAOS8ygY=;
        b=gc/mAOCiVoWUA+N/pP62HZZg02iQ1wSQ1B/N7TcYJk6kbv482/tFyxYRO8GT1VP/tT
         vVaDAzx35N5CCpPU8vnmVP+R1a1w/Xp8al0ke2OMHnUvUP9BQj+SqP44tFeEOVL7cS5x
         BQMa+6TgBoLnqeNyD36CaDbaOyIfVri6vKE4L17g5Ql3TA8hXiWMhJJJV+O6blDcPGbP
         lT3xQ/+peArEdQULdfTs5i/4vw3oUHH56GbGX/ilLID54y2V8GQnecKX1WB2NCtgDVqe
         WGLAYHlL632+uMRLZb9qM3J3iGWt+Y+BCW+/zSJH9hzkiqVyLjszwzzIFsXdbF6D0Clg
         udig==
X-Forwarded-Encrypted: i=1; AJvYcCWWjekttttbleZAYHQpV06ao1bDSQmODSQ6+I3WkpocAsHh7TRn0J4bpZ5+YU+dpmZ1eJvMCbkEm7xI7KlxfPEzcckL+m8zzFZldg==
X-Gm-Message-State: AOJu0YxJOnBExh2zuT0gRteEiRga1O9YYEZJj+7zrVDrnXV48PwA7Z5d
	DYC3kxkD5JGWMwJNRQAbmPMbJKVXRkqhSUS0TRo3E2ppL5orJbVKCX+75fyQLOXJiPwQp7JTV8b
	8mO7hg4qvndAbTxlstqBEu1MCl2ztYylxX4LpwyxEEDPJ6XFcffRuDAAkV1xYwWj8FksNKk4nFw
	PLcZuqDoQ/INsL70vO9UoHC44PygsvX+mppQ==
X-Received: by 2002:a92:cda2:0:b0:374:aedb:1607 with SMTP id e9e14a558f8ab-374b1e108e4mr11917215ab.0.1717552310600;
        Tue, 04 Jun 2024 18:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoAvumzWTEo5FkJ6C3OMbCpE5l3j5iU8XrNVp3YfRyiPEFNZA2Dhz1INdK+vIULCPwAJeNIpjtYyclX4eHIb4=
X-Received: by 2002:a92:cda2:0:b0:374:aedb:1607 with SMTP id
 e9e14a558f8ab-374b1e108e4mr11916935ab.0.1717552310203; Tue, 04 Jun 2024
 18:51:50 -0700 (PDT)
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
In-Reply-To: <CALu+AoQBXv-y43sx6E28UBVeVHUzRkWEzFxK6jsS5NpN2ho3YQ@mail.gmail.com>
From: Dave Young <dyoung@redhat.com>
Date: Wed, 5 Jun 2024 09:52:09 +0800
Message-ID: <CALu+AoTY2Xxs_vUzCyfsxtk-ov2mzJhzyTbbA9MYeeVkmKTMsw@mail.gmail.com>
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

> >         ...
> >         if (efi.memmap.flags & (EFI_MEMMAP_MEMBLOCK | EFI_MEMMAP_SLAB)) {
> >                 __efi_memmap_free(efi.memmap.phys_map,
> >                                 efi.memmap.desc_size * efi.memmap.nr_map, efi.memmap.flags);
> >         }
>
> From your debugging the memmap should not be freed.  This piece of
> code was added in below commit,  added Dan Williams in cc list:
> commit f0ef6523475f18ccd213e22ee593dfd131a2c5ea
> Author: Dan Williams <dan.j.williams@intel.com>
> Date:   Mon Jan 13 18:22:44 2020 +0100
>
>     efi: Fix efi_memmap_alloc() leaks
>
>     With efi_fake_memmap() and efi_arch_mem_reserve() the efi table may be
>     updated and replaced multiple times. When that happens a previous
>     dynamically allocated efi memory map can be garbage collected. Use the
>     new EFI_MEMMAP_{SLAB,MEMBLOCK} flags to detect when a dynamically
>     allocated memory map is being replaced.
>

Dan, probably those regions should be freed only for "fake" memmap?

