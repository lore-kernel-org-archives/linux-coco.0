Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6EF3CD09
	for <linux-coco@lists.linux.dev>; Tue,  3 Oct 2023 20:06:41 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5032a508e74so257e87.1
        for <linux-coco@lists.linux.dev>; Tue, 03 Oct 2023 13:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696363599; x=1696968399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff/bZsYuq+zI3VEWzGF0gVtBAZcX+KkCBc/Qd+3ae90=;
        b=I0v8R+wMdMIjDDEuX6WRldGwmPXj4EAK8B1SjMWuecZ6R1+oMvCx+CS2DO8NppS81E
         37o+YO8MM2Cx651lybHuPWv3iZ6/SlWmm/wygbEAzzoW0UTM83Hj3Ck9WV9qSpGRCkcn
         Ymx8ellLx+OihmFsm2fx/jdwQDxxTn8Nl+FF/akDth8HKCt5b7fzHr7tNGDCf2fsUDKa
         TYEWfvq5ndqfl51YlN0NY3n+/Nbbgg2GZb6IWLNBl/YqJ0dowobewaTZdMpDCVOiiiUo
         s26JKYReSFqB4tDapDGIOdck71l/d7Pzh/HBWK++9PwhdKLzxr4jjuRCEb3BHEfRMgn9
         TAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696363599; x=1696968399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ff/bZsYuq+zI3VEWzGF0gVtBAZcX+KkCBc/Qd+3ae90=;
        b=WyyWmSx49tS4WEGDerTLiYKxwhyPiDMgfEnzsPW8jL6ap1b7m5S7N3yBJb8CBiDqVA
         P9UQkfPDJKeGUOWR8jQ62J3Wk5UFpwaeOMAAeljTQQKtCFxYj5eJLfaU2RhROzusWiRP
         IgBslnkd6VTprvmm4EGzyDIdzBuIggKqW8P+CTovpi54txh3olNQCmeIiL2m5fK9H0IS
         aMEsiJGwkjxECZqqFNf0seeJAmrFwb6vXovYE4G47lldE96zY4jYSHdQU7qXiooVaZ24
         VuBI7lvBJ4WVTTOpIbawoQBlqex8dlElyKhEm+m1Sp1RHI8DhwOiNos55Q+HFomjeepL
         vylA==
X-Gm-Message-State: AOJu0YwjWiBMKZg8wThvu1Mux0l6USYqz4zszeXpAle8W7BFqQV7VBeG
	u7DKFVkgqVidA2BOJgE6UDcU2c6W6kS6o3rlOyuRlA==
X-Google-Smtp-Source: AGHT+IFv8j1JSoMEjmn5MOSMgU2Q4Q2lh32wNdNw2LlZm2l/biR3NLNtW7RcEu/AI79qjvGTvbHbKFIhJtTAFblZItU=
X-Received: by 2002:a19:7605:0:b0:501:ba53:a4f7 with SMTP id
 c5-20020a197605000000b00501ba53a4f7mr20520lff.0.1696363599396; Tue, 03 Oct
 2023 13:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
 <169570185411.596431.3153227201984845022.stgit@dwillia2-xfh.jf.intel.com>
 <CAMkAt6r2VPPMZ__SQfJse8qWsUyYW3AgYbOUVM0S_Vtk=KvkxQ@mail.gmail.com>
 <651602dc4c6e3_91c1e2947f@dwillia2-xfh.jf.intel.com.notmuch>
 <CAMkAt6rrzS85ZT9T7r6iwQHoVyEPwaxQ3Xayp_6XMbU+RJzS4w@mail.gmail.com>
 <CAMkAt6rwSwES_hEac=_7Gg8wcGosHMPXA3J2g_BGC_c+NbVp1w@mail.gmail.com> <9eee8abb-a1ba-46af-8317-0bc1c78179b3@linux.intel.com>
In-Reply-To: <9eee8abb-a1ba-46af-8317-0bc1c78179b3@linux.intel.com>
From: Peter Gonda <pgonda@google.com>
Date: Tue, 3 Oct 2023 14:06:27 -0600
Message-ID: <CAMkAt6odZAoQxNQ=HogTRB6dkmnK3t1Nr3+4SWpmAP-mqfqOiw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] virt: tdx-guest: Add Quote generation support
 using TSM_REPORTS
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev, 
	Erdem Aktas <erdemaktas@google.com>, peterz@infradead.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2023 at 1:29=E2=80=AFPM Kuppuswamy Sathyanarayanan
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
> Hi,
>
> On 10/3/2023 11:37 AM, Peter Gonda wrote:
> > On Fri, Sep 29, 2023 at 11:26=E2=80=AFAM Peter Gonda <pgonda@google.com=
> wrote:
> >>
> >> On Thu, Sep 28, 2023 at 4:49=E2=80=AFPM Dan Williams <dan.j.williams@i=
ntel.com> wrote:
> >>>
> >>> Peter Gonda wrote:
> >>>> On Mon, Sep 25, 2023 at 10:17=E2=80=AFPM Dan Williams <dan.j.william=
s@intel.com> wrote:
> >>>>>
> >>>>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.=
intel.com>
> >>>>>
> >>>>> In TDX guest, the attestation process is used to verify the TDX gue=
st
> >>>>> trustworthiness to other entities before provisioning secrets to th=
e
> >>>>> guest. The first step in the attestation process is TDREPORT
> >>>>> generation, which involves getting the guest measurement data in th=
e
> >>>>> format of TDREPORT, which is further used to validate the authentic=
ity
> >>>>> of the TDX guest. TDREPORT by design is integrity-protected and can
> >>>>> only be verified on the local machine.
> >>>>>
> >>>>> To support remote verification of the TDREPORT in a SGX-based
> >>>>> attestation, the TDREPORT needs to be sent to the SGX Quoting Encla=
ve
> >>>>> (QE) to convert it to a remotely verifiable Quote. SGX QE by design=
 can
> >>>>> only run outside of the TDX guest (i.e. in a host process or in a
> >>>>> normal VM) and guest can use communication channels like vsock or
> >>>>> TCP/IP to send the TDREPORT to the QE. But for security concerns, t=
he
> >>>>> TDX guest may not support these communication channels. To handle s=
uch
> >>>>> cases, TDX defines a GetQuote hypercall which can be used by the gu=
est
> >>>>> to request the host VMM to communicate with the SGX QE. More detail=
s
> >>>>> about GetQuote hypercall can be found in TDX Guest-Host Communicati=
on
> >>>>> Interface (GHCI) for Intel TDX 1.0, section titled
> >>>>> "TDG.VP.VMCALL<GetQuote>".
> >>>>>
> >>>>> Trusted Security Module (TSM) [1] exposes a common ABI for Confiden=
tial
> >>>>> Computing Guest platforms to get the measurement data via ConfigFS.
> >>>>> Extend the TSM framework and add support to allow an attestation ag=
ent
> >>>>> to get the TDX Quote data (included usage example below).
> >>>>>
> >>>>>   report=3D/sys/kernel/config/tsm/report/report0
> >>>>>   mkdir $report
> >>>>>   dd if=3D/dev/urandom bs=3D64 count=3D1 > $report/inblob
> >>>>>   hexdump -C $report/outblob
> >>>>>   rmdir $report
> >>>>>
> >>>>> GetQuote TDVMCALL requires TD guest pass a 4K aligned shared buffer
> >>>>> with TDREPORT data as input, which is further used by the VMM to co=
py
> >>>>> the TD Quote result after successful Quote generation. To create th=
e
> >>>>> shared buffer, allocate a large enough memory and mark it shared us=
ing
> >>>>> set_memory_decrypted() in tdx_guest_init(). This buffer will be re-=
used
> >>>>> for GetQuote requests in the TDX TSM handler.
> >>>>>
> >>>>> Although this method reserves a fixed chunk of memory for GetQuote
> >>>>> requests, such one time allocation can help avoid memory fragmentat=
ion
> >>>>> related allocation failures later in the uptime of the guest.
> >>>>>
> >>>>> Since the Quote generation process is not time-critical or frequent=
ly
> >>>>> used, the current version uses a polling model for Quote requests a=
nd
> >>>>> it also does not support parallel GetQuote requests.
> >>>>>
> >>>>> Link: https://lore.kernel.org/lkml/169342399185.3934343.30358453483=
26944519.stgit@dwillia2-xfh.jf.intel.com/ [1]
> >>>>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswa=
my@linux.intel.com>
> >>>>> Reviewed-by: Erdem Aktas <erdemaktas@google.com>
> >>>>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> >>>>
> >>>> Hey Dan,
> >>>>
> >>>> I tried running your test commands on an SNP enabled guest. To build
> >>>> the kernel I just checked out linus/master and applied your series. =
I
> >>>> haven't done any debugging yet, so I will update with what I find.
> >>>>
> >>>> root@Ubuntu2004:~#   hexdump -C $report/outblob
> >>>> [  219.871875] ------------[ cut here ]------------
> >>>> [  219.876642] kernel BUG at include/linux/scatterlist.h:187!
> >>>
> >>> Ok, it does not like virtual address of one of the buffers, but my
> >>> changes "should" not have affected that as get_ext_report() internall=
y
> >>> uses snp_dev->certs_data and snp_dev->response for bounce buffering t=
he
> >>> actual request / response memory. First test I want to try once I can
> >>> get on an SNP system is compare this to the ioctl path just make sure
> >>> that succeeds.
> >>
> >
> > I think there may be an issue with CONFIG_DEBUG_SG. That was the
> > warning we were getting in my above stack trace:
> >
> >> [  219.876642] kernel BUG at include/linux/scatterlist.h:187!
> >
> > This was for this line in enc_dec_message():
> >
> >         sg_set_buf(&src[1], src_buf, hdr->msg_sz);
> >
> > I am not sure why in sg_set_buf() virt_addr_valid() returns false for
> > the address given in the sev_report_new() which is from the variable
> > 'ext_req' which is stack allocated?
> >
> > static inline void sg_set_buf(struct scatterlist *sg, const void *buf,
> >      unsigned int buflen)
> > {
> > #ifdef CONFIG_DEBUG_SG
> >     BUG_ON(!virt_addr_valid(buf));
> > #endif
> >     sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
> > }
> >
> > When I disable CONFIG_DEBUG_SG in my config. Your patch seems to work,
> > well at least it doesn't crash the guest. I haven't checked if the
> > report is valid yet.
> >
>
> Dan, do you think it is related to not allocating direct mapped memory (u=
sing
> kvalloc)?

But I think the issue is the stack allocated variable 'ext_req' here:

sev_report_new()
+       void *buf __free(kvfree) =3D kvzalloc(size, GFP_KERNEL);
+       if (!buf)
+               return -ENOMEM;
+
+       guard(mutex)(&snp_cmd_mutex);
+       certs_address =3D buf + report_size;
+       struct snp_ext_report_req ext_req =3D {
+               .data =3D { .vmpl =3D desc->privlevel },
+               .certs_address =3D (__u64)certs_address,
+               .certs_len =3D ext_size,
+       };
+       memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);


>
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
