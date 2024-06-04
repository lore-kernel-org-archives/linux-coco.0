Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EBE145B01
	for <linux-coco@lists.linux.dev>; Tue,  4 Jun 2024 11:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717499384; cv=none; b=e3Rq+t7Rw/XhlHoezr49vR7hU4eVMt2hGSZVyY8BWtu69V4qMGXEv217XL371niCmsJ4yzLibMRej/OLDQPk2AAP/Ik7fZHg3TX+tGdjQaB2MIAq3ye9h0qR2O4fN7K4hJJ1pdKJtaF039SZmC5ycxviUtT+bXESau8QPG+aVYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717499384; c=relaxed/simple;
	bh=lYunvJ6GmzDvX5Mv0MNwlWNQS4u2NfOKF2xbK6rhKRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vn5pRQdbKOei0lzXYsMq+Kmr1xk8SOz4xyUT9HRBgyJEHtwZ+KV2TlGkJVcPQMQsXFNQ1uzNIQkIE+y+qV2WrVuXOLecdMtvIZs6kduUvL3kpAngXo7kg59/WHK11i1BiBDJ/7J8u2IgHiyMDdGQwClAk5W9hiC7eUmM9spM34Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GnN7Qcix; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GnN7Qcix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717499382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g1CYcVwVGdFbPFSwugJtb1aKEbbUUrRo/R593DHF02Q=;
	b=GnN7QcixDSI6aZ7wbjCtOL4S9AnM/K0N4lwt5mwkWhBGDpcTtFr6x3ZJEDFX4giyhGBp96
	6/NYCoqsCW2gXNFya+5km/Q1Bui/6k43bb6p+kQ8LTbM0wHW08mjhaJkFby2zK+Ro0hU3w
	SkfJOioNVjuk+g1JUpTQS39v5nslWhM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-jUqBRpcoMbWp5rYmiC4RjQ-1; Tue, 04 Jun 2024 07:09:41 -0400
X-MC-Unique: jUqBRpcoMbWp5rYmiC4RjQ-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-37492552bf7so4969505ab.1
        for <linux-coco@lists.linux.dev>; Tue, 04 Jun 2024 04:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717499380; x=1718104180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1CYcVwVGdFbPFSwugJtb1aKEbbUUrRo/R593DHF02Q=;
        b=GaUdjIfg/f0/MV4Wr3ytE32IAcPaFlE+QRUkyjPFO6YQApTZnjbhj/b5tid0RgLWkH
         iW7ipnM0VMhIVpzxlpzmnGT2WjHjSpYjU0HjPJwIWvMUKF/yTiI6bdq6tF8Ju0EyP8tn
         i1S2w1lJjrkuyJRIeY55YXRVZbTM3I3Drh3y77SnBFOkoiUIhAYQLy+bxICayGS8GklK
         NloCx3qM+JJGBNVL+H555BbHHCBT8WSSzI7eEH2myKaGJnJkJ640FDRvvFBpoqT2Sh9P
         tm3w43Dbe+Z4VtgkyBY/3uQfX26LUGphKx4UUyYDMTL/r2u1Y82fIXv1hW9P9S6NkrVN
         e2tg==
X-Forwarded-Encrypted: i=1; AJvYcCUYILyk8rCvEzTGdUeTYRXiQXOfXYKHuSK1eEP5+gGkutZKcvGT5afT9O9hzUUA1JJUyRsZjIVAl+EGScqDNiRnA1mdpZDloYYMkA==
X-Gm-Message-State: AOJu0Ywq87+Jwtqma5nwWTfmm5TPidB5H3FwW8kBEOhUNIkeL4vUlHPD
	CZuUBRdyqyf+DZ8+IEbgXBv4Jf6ahWWL68MJA3+PJrcEeAF1qnRDFTeOqANoM6riUiBjsqcFbzZ
	F0QM+4tkQeowo36czgEN15IxmkeJNrDUTDe7Fir3KhIjdDU9v6Na7y2wDYJ0f9EtkWIhoqFB3XO
	BZrS7RGsLG0xpwF8v69QHX/TAUzYcMBmXb8g==
X-Received: by 2002:a05:6e02:1e08:b0:374:85bb:7592 with SMTP id e9e14a558f8ab-3748b8f5126mr139248035ab.0.1717499380389;
        Tue, 04 Jun 2024 04:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFst0U81Ttgn3X/ZFD/HP/TlZoB/pgBQKLugq4Ox4uYNFUHLID+6ovlnSkl6nuMD6Uc/ffi7a31slBzFXhlhUw=
X-Received: by 2002:a05:6e02:1e08:b0:374:85bb:7592 with SMTP id
 e9e14a558f8ab-3748b8f5126mr139247745ab.0.1717499379997; Tue, 04 Jun 2024
 04:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
 <cover.1717111180.git.ashish.kalra@amd.com> <f4be03b8488665f56a1e5c6e6459f447352dfcf5.1717111180.git.ashish.kalra@amd.com>
 <20240603085654.GBZl2FVjPd-gagt-UA@fat_crate.local> <8e3dfc15-f609-4839-85c7-1cc8cefd7acc@amd.com>
 <Zl3HfiQ6oHdTdOdA@kernel.org> <1ef36309-8d7f-447b-a54a-3cdafeccca64@amd.com>
 <20240603144639.GCZl3XTwmFHwi-KUZW@fat_crate.local> <Zl3hwYL2GDiyUfGo@kernel.org>
 <CALu+AoSnA4323QbQG7wrNptosz7tfEfztsE1=o6G=FaLbQ_tKQ@mail.gmail.com> <20240604094358.GBZl7h3otTCYJ5rkkt@fat_crate.local>
In-Reply-To: <20240604094358.GBZl7h3otTCYJ5rkkt@fat_crate.local>
From: Dave Young <dyoung@redhat.com>
Date: Tue, 4 Jun 2024 19:09:56 +0800
Message-ID: <CALu+AoS=-=PbMRxC-1rpfSTPpMOmM5BGRBjLhDwgOC3=4C71ng@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] efi/x86: Fix EFI memory map corruption with kexec
To: Borislav Petkov <bp@alien8.de>
Cc: Mike Rapoport <rppt@kernel.org>, "Kalra, Ashish" <ashish.kalra@amd.com>, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org, 
	rafael@kernel.org, hpa@zytor.com, peterz@infradead.org, 
	adrian.hunter@intel.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	jun.nakajima@intel.com, rick.p.edgecombe@intel.com, thomas.lendacky@amd.com, 
	michael.roth@amd.com, seanjc@google.com, kai.huang@intel.com, bhe@redhat.com, 
	kirill.shutemov@linux.intel.com, bdas@redhat.com, vkuznets@redhat.com, 
	dionnaglaze@google.com, anisinha@redhat.com, jroedel@suse.de, ardb@kernel.org, 
	kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Jun 2024 at 17:44, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Jun 04, 2024 at 09:23:58AM +0800, Dave Young wrote:
> > kexec_in_progress is only for checking if this is in a reboot (kexec) code path.
> > But eif_mem_reserve is only called during the boot time so checking
> > kexec_in_progress is meaningless here.
> > current_kernel_is_booted_via_kexec != is_rebooting_with_kexec
>
> That's exactly what I wanna check: whether this is a kexec-ed kernel. Or
> is there a better helper for that?

No general way to check if it is a kexec-ed kernel or not,  for x86
one can check the efi_setup as Ashish's original patch did, as the
kexec booted kernel (efi boot) will have efi setup_data passed in.

Otherwise there is a type_of_loader field for x86 boot protocol,
kexec-tools is 0x0D, the kexec_file_load also uses this.  But adding
the type_of_loader was only added in kexec-tools code when Yinghai
worked on the kexec-tools bzImage64 load, so older kexec-tools will
not set this field.  Anyway the in-kernel kexec_file_load code for x86
added 0x0D as loader type from the beginning.

Anyway there is not such a helper for all cases.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

