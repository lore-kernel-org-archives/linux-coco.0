Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58B41C70
	for <linux-coco@lists.linux.dev>; Fri, 22 Mar 2024 17:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711128536; cv=none; b=bzjCNYJJw3ieQ74rnp5G1FzD26+aFsP7iYuQr6d0BR/v3uYVs7WnyeadUpVm208R/khyeF03y4bcss9TdpGv6vfXOmKBcfqBfArm8orKw0yE7PPxenKCuV/cp6kcic99sy7eVlNU6oAm2lV9asPjgyrv4HgiUg6kjL/VeDU4WuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711128536; c=relaxed/simple;
	bh=3s8zO+5/GkRQ+yd/mwoIAGEHYpmFZBZ5Fvnif3dCZzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZ5ayfkdlGUDyc/iNoKmoyZCFPce1YEt6Lx4kqqMUJoWY0wsa6IKvV2P7HWaZ1ZEcByph0FhHFk5/NmWLA2+nzKx2+RRPF3sooNwyOvonXX37GpMK2OtSRfViim7c5LdDZJB5b7lf8m7yhBigcQOk8CQn/sH0r6iE7XI1zSMiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cxj2+vfu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cxj2+vfu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4140eed8a4fso5885e9.0
        for <linux-coco@lists.linux.dev>; Fri, 22 Mar 2024 10:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711128533; x=1711733333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rPBWYF9z+UP9aaxqvoHtBeq2b6tPqjk5QAHWIW9OgY=;
        b=cxj2+vfuL9yum6NRDE/N7PSuLH8aupJOkLq8xldaSfcFfJVE4mYzH7Le5ZPEOY2O1X
         3hU0PY05sQ7c02UX1zU7HQXWD52PW4MxbhgOZ2AGUIgAPckLyd1LARdttBXrA/Dik/lY
         2LAfi8sl0Pwok3NkKizrMc6yvCt4JsPtQReB96z398OGv0fmQ/meTGwHr8KAdbyfgahn
         N4PyzX4ndv+J75+dR1Te+Gbu87T+CIL+hbs0Ni6mrF035kGPMtJCFrDAZ1OdeFWmrQzx
         KZaXZJjVgQI7fX3Y9bpRpo7ZT2qrZul3wTqjTpajN/wKARkhmfOazHsPjYQIFCGZAUJS
         mBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711128533; x=1711733333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rPBWYF9z+UP9aaxqvoHtBeq2b6tPqjk5QAHWIW9OgY=;
        b=QIQ95EGJDCu8ffNjgFjWpTnHNu7Ah2rt5QWpsnqmHF7tuZd0NJkAyd0xbIzmbADyBZ
         FwIYoRFmZb9FwqL1ALzgOIe8brZ4imByGCJ2ppGHRvYcJmXy3tw31ytUIZqgQ8XIdIxT
         UNLzWNsgmdYo6sZT8lltko+0WBLZXcV1lg6hA2qWK9Y1CyoKbF8PQi8V5HiL1meA47OX
         kaT88s62xKgkRWu0YpTVNaF6630p3gI8iT5+zCgxekYy3imXjxIclr3uddzJVT1PAlip
         Usm6BQVqI/4cqhkxH8DeFg+Gcd4TjSVgyGv0/qkeEAwh0tX7VXgCt+Fj+28KBFDCuAvb
         za3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDFG8AniTcjdyB/MZfGrGfZ/UX+B4/Dm87U/wbLTsAQNPEBgfh7ry+MW0KIBmx806vhC3i470CPKRNt3z2/u4y2/o3tx1/mYVBhQ==
X-Gm-Message-State: AOJu0YzgW16VKderrprTA4Mr3Juilem/F3v1NXk+5vcSUq/l0ezD0skx
	b8CrqQmOfR2qtYN1mXuxI1kQrjWpfaRkT03TbEiYpc7LIj7d2PoIlolHvT65JrQPnJiBjKCFuo6
	wY3UmB/VGcPzQh2Y9eG7jeju7D+qTfMqx3wr9
X-Google-Smtp-Source: AGHT+IFNz3OvUvxwK5zd02bbnjlbPXEFlCYTKKtIe//eLxsCkm+JKvnTuE0WPTuNw9hVBcCnjBXmKRPmVcFJXSsL9Xk=
X-Received: by 2002:a05:600c:3b94:b0:413:f266:c654 with SMTP id
 n20-20020a05600c3b9400b00413f266c654mr495882wms.1.1711128532974; Fri, 22 Mar
 2024 10:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie> <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
In-Reply-To: <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
From: Qinkun Bao <qinkun@google.com>
Date: Fri, 22 Mar 2024 10:28:41 -0700
Message-ID: <CAOjUGWcdDX2Nt7hSJSvLZOBnGv318TXiKh8CdvutYr8L8H_6QA@mail.gmail.com>
Subject: Re: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for coexistance
 of vTPM and RTMR.
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Yao, Jiewen" <jiewen.yao@intel.com>, 
	"devel@edk2.groups.io" <devel@edk2.groups.io>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Peter Gonda <pgonda@google.com>, 
	James Bottomley <jejb@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 7:57=E2=80=AFAM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> On Fri, Mar 22, 2024 at 1:52=E2=80=AFAM Gerd Hoffmann <kraxel@redhat.com>=
 wrote:
> >
> > On Fri, Mar 22, 2024 at 02:39:20AM +0000, Yao, Jiewen wrote:
> > > Please aware that this option will cause potential security risk.
> > >
> > > In case that any the guest component only knows one of vTPM or RTMR,
> > > and only extends one of vTPM or RTMR, but the other one only verifies
> > > the other, then the chain of trust is broken.  This solution is secur=
e
> > > if and only if all guest components aware of coexistence, and can
> > > ensure all measurements are extended to both vTPM and RTMR.  But I am
> > > not sure if all guest components are ready today.
> >

Thank you for the feedback. I believe it is the existing status even
without the patch.
Both EFI_CC_MEASUREMENT_PROTOCOL and EFI_TCG2_PROTOCOL
are exposed by TDVF when CC_MEASUREMENT_ENABLE is set to true even
without the patch. TDVF only measures with EFI_CC_MEASUREMENT_PROTOCOL
protocol. However, since both protocols exist, Shim and Grub2 measure
into both CCand TPM. In the guest, the user can access both the event log f=
or
TPM andvRTMR. Some of the event logs for TPM are missing without the patch.
As Dionna mentioned (CVE-2021-42299), measuring into every device that
is available seems to be a safer choice.  It's a mistake we've
concretely made in the past.

I am thinking your biggest concern is OS. Fortunately, there is no
accepted patch in the kernel that appears to have
EFI_CC_MEASUREMENT_PROTOCOL support. Once this
patch is accepted, we will work with the kernel community to recommend
the following code pattern "for device in measurement_devices:
device.Extend(bla)" for all guest components.





> > As far I know (it's been a while I looked at those patches) shim.efi an=
d
> > grub.efi have support for EFI_CC_MEASUREMENT_PROTOCOL, but use the same
> > logic we have in DxeTpm2MeasureBootLib, i.e. they will not measure to
> > both RTMR and vTPM.
>
> Shim will measure into CC and then continue to measure into TPM
> https://github.com/rhboot/shim/blob/126a07ebc30bbd203b6966465b058da741b26=
54b/tpm.c#L164
>
> GRUB2 has the same behavior. We can at least get coexistence
> supporting the current boot integrity strategy that Confidential Space
> is using, which is to depend on a dmverity initramfs whose root hash
> is in the kernel_cmdline, and a Linux kernel built with LOADPIN. The
> changes to Linux are proposed but not accepted precisely due to this
> conversation we're having now.
> I recall describing this to another CSP engineer at an IETF meeting
> and they claimed they used the same approach, but I can't remember if
> that was Oracle or another company.
>
