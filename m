Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E0214ABA
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJJQKEdi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700557843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8VqgPmAQ7EIQTV/xERi+bscdvu2asecBTlQhyi8tn8=;
	b=TJJQKEdiN7PsK441nJT6jf7y+Ubh/GbA2suSlEDL725OKyjqRyw+HHeBAQ7jsnfuJ6mD1X
	CwM1OckGDlTF9kNPkJIVC8nRe8TNuhZohEFh4nR7gKeenz5cQf8KnouDWbBMFZ6y1svgxP
	NG5APpNN3drQOOpEvcqG64K1XpooNRg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-zzap8SQpMNeU_FWf92yTLg-1; Tue, 21 Nov 2023 04:10:39 -0500
X-MC-Unique: zzap8SQpMNeU_FWf92yTLg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a01991968f5so42412366b.2
        for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 01:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700557838; x=1701162638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8VqgPmAQ7EIQTV/xERi+bscdvu2asecBTlQhyi8tn8=;
        b=M2mozwaEMDrbgmz3HiWVRzcYAT7oW9aZXDApfqMBRg2J/vgcace7gNvdeyC6OnvK3s
         Qu6l8y6H7RTvf5bVMnpmYXmSIJiNGG5FMNx85hL2yume3Lzfgi0w86QAmL/l2QlLUNeQ
         btybzox/e3kUidC43uExvDX5Q8mtTz+nkgsPfaAo0XllAXllXDvblai9nFMu+/V0XZMy
         2TxTdHXcfU3XRl3V8Kl+HrpRsFnpNK6ScZtbbKiG+ximCjJ7xvWlaUcob7QR1IkFUGfL
         f1vB91PBu7W/zO4nurYcTL8glMpg0xBMjERbiHgIyXvHytsQe2Qe3/miVngLSDnDiKQk
         AJbw==
X-Gm-Message-State: AOJu0YwnvhL6SPB4sJnRA14/pS8FRk8QDRSesPnYZPEy+2kdcCFo9Hn5
	Nk5if1rIzp8xYtJh5P0jWyxN9PHCIs813WgdYL7wxTJqzeEcttbatqqp4rzFRkMuan7ac6y0Pgu
	kZuwsWdFW2eo1302JpJseaoj0KUTAHOucwdlbYw==
X-Received: by 2002:a50:8d11:0:b0:548:4f16:ecfc with SMTP id s17-20020a508d11000000b005484f16ecfcmr1597933eds.0.1700557838119;
        Tue, 21 Nov 2023 01:10:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHVgvgj/1BJKpcUGeJXQN3MkvUneS3BEt5tns8r5WTn76N6o3GvUesVzThqilYiqkw7YjUG83i+KTKDSln3uA=
X-Received: by 2002:a50:8d11:0:b0:548:4f16:ecfc with SMTP id
 s17-20020a508d11000000b005484f16ecfcmr1597896eds.0.1700557837682; Tue, 21 Nov
 2023 01:10:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231115120044.8034-1-kirill.shutemov@linux.intel.com>
 <ZVYGx1EwzjXbTEyX@MiWiFi-R3L-srv> <20231116125612.daxettqcapled7ac@box.shutemov.name>
 <ZVYkdI74X8acDtTq@MiWiFi-R3L-srv> <ZVYrA+Ks0DGFo/0p@MiWiFi-R3L-srv>
 <20231117124748.umfuc3no2qvh4shj@box.shutemov.name> <ZVeApN4lDqTLu7ma@MiWiFi-R3L-srv>
 <20231117154632.zvi6g6lblmtvikzt@box> <ZVxRBLsQcv8KRasA@MiWiFi-R3L-srv> <20231121084321.t44ntae5ohslgrme@box.shutemov.name>
In-Reply-To: <20231121084321.t44ntae5ohslgrme@box.shutemov.name>
From: Tao Liu <ltao@redhat.com>
Date: Tue, 21 Nov 2023 17:10:01 +0800
Message-ID: <CAO7dBbWb2UWJRm1LLXOq7MM1K6BxDetL8tTmW93H589FGz8n9g@mail.gmail.com>
Subject: Re: [PATCHv3 00/14] x86/tdx: Add kexec support
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Baoquan He <bhe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Kalra, Ashish" <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>, 
	"Huang, Kai" <kai.huang@intel.com>, kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kirill,

On Tue, Nov 21, 2023 at 4:43=E2=80=AFPM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Tue, Nov 21, 2023 at 02:41:08PM +0800, Baoquan He wrote:
> > > >
> > > > Still failed. And I found the normal reboot does't work either. I w=
ill
> > > > do more testing tomorrow, e.g use the tdx-tools's own rhel9 kernel
> > > > config and rebuild, and update host kernel too.
> >
> > I did more tests, resuls are summarized as below:
> >
> > 1) kexec reboot works, but always fallback to 1 cpu even though multipl=
e
> > cpus are specified;
>
> That's expected. Until you have new BIOS. See below.
>
> > 2) kdump kernel need more crashkernel memory to boot up,
> >    crashkernel=3D512M works well in our case.
>
> I guess it is due to SWIOTLB memory which requres at least 64M.
>
> >  But it failed in vmcore
> >    saving process, either makedumpfile or cp can't access the 1st
> >    kernel's old memory;
>
> Will look into it.
>
> > 3) Normal reboot always failed;
>
> It is expected. TD vCPUs are not resettable. So we need to destroy TD and
> construct a new one to emulate "reboot".
>
> I guess we can try to add some glue on QEMU side to make reboot more
> seamless.
>
> > My colleague Tao helped to double check this, he got the same testing r=
esult.
> > Plesae
> > 1) what can we do to enable the multiple cpu support for kexec reboot?
>
> You would need a patched BIOS image. I've hacked one[1] for my testing.
> But it only works if kernel runs in 4-level paging mode (specify no5lvl i=
n
> kernel command line).
>
> BIOS folks work on proper patch, but it is not ready yet.
>
> [1] https://gist.github.com/kiryl/e1dc1719e0c990b3ceee5d8de8dbf332
>
Thanks a lot for providing the BIOS patch. One more question, is the
patched BIOS image for the host physical machine or for the tdx guest
vm?

Thanks,
Tao Liu

> > 2) anything missing to allow makedumpfile/cp access 1st kernel's memory=
?
>
> It worked before for us, but I have not checked for a while.
>
> I expected you've dropped my "if (crash) return;" debug patch I asked you
> to tested before, right? If not, failure is expected.
>
> > 3) not sure if this is particular case on the system we tested on.
>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
>
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
>

