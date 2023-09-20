Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98041A80
	for <linux-coco@lists.linux.dev>; Wed, 20 Sep 2023 21:10:38 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6562395dfcfso1378416d6.0
        for <linux-coco@lists.linux.dev>; Wed, 20 Sep 2023 14:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695244238; x=1695849038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXVITGDPGvQXDKgdBYzXMtxm4MnaABDXn0LhtEv8kjo=;
        b=Dz+YELXD/FBFhbPa2mVkhVN8v8atB9qAtl3vdv79tnAsyTh6I21xi/U0vpnDTGB7ap
         VKJehNiIX1hLqWkHe30iLUcDXf9m8EfA/g4JagIpZVkRn4SXvQgQqNPjBtsWjrFVxLVD
         q/83XZo9uSDgDVXdcHBTmE14Tm2kFae0J/JyKUbu55THQoGcItQ0kfMEBUBwIk7KFl7f
         lIejN85z8YPeAhwj67kitlWEAr/5etQHor3yrEyJBaG0A3Dvt1DVw/zRBcouUWtxLPaQ
         bsX5q+jncXz7g3pC8fhRkcfAdJfs+s9JOAkaT7V4vFfRfnv0zpjubPv7WbLiZQ5lDhBp
         nFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695244238; x=1695849038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXVITGDPGvQXDKgdBYzXMtxm4MnaABDXn0LhtEv8kjo=;
        b=RODR6VtjAzyipLTgce1QfswbjdvYVJiOUjofJDiQa8CJDWrezeJ2kuEu+AUa4rU/3f
         01dQVwJyJEMOJXcMvZE1RxTkjRpuXLsnnt4g0jcsypIR4flVRxuIxr1RkhSxEM7w3eIV
         yC6+jOIk9zbfmoPm3lRTtRKL0NydJ0OTW3v7EeTmeoknnfwHCSvyzvt67JbUzIyg/TLf
         Wuf65+3jEXbV2RCEkwNcZPi5awARZddu/1Xkq7JltGr8Q5nxJz2EZoWW4evdwpBeGibV
         PTHTEO5iwgvScXjGRDlT2rivkuCdWRFLSnvlcSLqaHyAkLPf2CrqSALjXLluRgJnakxX
         lnVg==
X-Gm-Message-State: AOJu0Yzzwxf8Tr/eXZw+tBcJ++8n6Mu+1v0rTrl0Y9INtZ8T6M2iD3Dg
	cManuW5MDbo1mScD58C3TEVvWG3i4ir2ECwYBhw90Q==
X-Google-Smtp-Source: AGHT+IHF+PKtY/XLs6DFjozMcBQSZrG+xGJgOF7lfnIvU2EVUGfVMIHmP5vBzDPomAit7X5jsh51N08gENI1hJXfk/Y=
X-Received: by 2002:a05:6214:398b:b0:657:ace:63eb with SMTP id
 ny11-20020a056214398b00b006570ace63ebmr3576716qvb.54.1695244237653; Wed, 20
 Sep 2023 14:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914031349.23516-1-sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230914031349.23516-1-sathyanarayanan.kuppuswamy@linux.intel.com>
From: Erdem Aktas <erdemaktas@google.com>
Date: Wed, 20 Sep 2023 14:10:26 -0700
Message-ID: <CAAYXXYy0yh8CvnmatUwcUe28G37kEJoE8ZVTtNJU3+Y7SDnfzA@mail.gmail.com>
Subject: Re: [PATCH v2] virt: tdx-guest: Add Quote generation support using TSM_REPORTS
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Tony Luck <tony.luck@intel.com>, Wander Lairson Costa <wander@redhat.com>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Qinkun Bao <qinkun@apache.org>, 
	Guorui Yu <GuoRui.Yu@linux.alibaba.com>, linux-coco@lists.linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 8:14=E2=80=AFPM Kuppuswamy Sathyanarayanan
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
> In TDX guest, the attestation process is used to verify the TDX guest
> trustworthiness to other entities before provisioning secrets to the
> guest. The First step in the attestation process is TDREPORT
> generation, which involves getting the guest measurement data in the
> format of TDREPORT, which is further used to validate the authenticity
> of the TDX guest. TDREPORT by design is integrity-protected and can
> only be verified on the local machine.
>
> To support remote verification of the TDREPORT (in a SGX-based
> attestation), the TDREPORT needs to be sent to the SGX Quoting Enclave
> (QE) to convert it to a remotely verifiable Quote. SGX QE by design can
> only run outside of the TDX guest (i.e. in a host process or in a
> normal VM) and guest can use communication channels like vsock or
> TCP/IP to send the TDREPORT to the QE. But for security concerns, the
> TDX guest may not support these communication channels. To handle such
> cases, TDX defines a GetQuote hypercall which can be used by the guest
> to request the host VMM to communicate with the SGX QE. More details
> about GetQuote hypercall can be found in TDX Guest-Host Communication
> Interface (GHCI) for Intel TDX 1.0, section titled
> "TDG.VP.VMCALL<GetQuote>".
>
> Trusted Security Module (TSM) [1] exposes a common ABI for Confidential
> Computing Guest platforms to get the measurement data via ConfigFS.
> Extend the TSM framework and add support to allow an attestation agent
> to get the TDX Quote data (included usage example below).
>
>   report=3D/sys/kernel/config/tsm/report/report0
>   mkdir $report
>   dd if=3D/dev/urandom bs=3D64 count=3D1 > $report/inblob
>   hexdump -C $report/outblob
>   rmdir $report
>
> GetQuote TDVMCALL requires TD guest pass a 4K aligned shared buffer
> with TDREPORT data as input, which is further used by the VMM to copy
> the TD Quote result after successful Quote generation. To create the
> shared buffer, allocate a large enough memory and mark it shared using
> set_memory_decrypted() in tdx_guest_init(). This buffer will be re-used
> for GetQuote requests in the TDX TSM handler.
>
> Although this method reserves a fixed chunk of memory for GetQuote
> requests, such one time allocation can help avoid memory fragmentation
> related allocation failures later in the uptime of the guest.
>
> Since the Quote generation process is not time-critical or frequently
> used, the current version uses a polling model for Quote requests and
> it also does not support parallel GetQuote requests.
>
> Link: https://lore.kernel.org/lkml/169342399185.3934343.30358453483269445=
19.stgit@dwillia2-xfh.jf.intel.com/ [1]
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@lin=
ux.intel.com>
> ---
>
> Hi All,
>
> The original version of this patch series [1] added support for TDX
> Guest Quote generation via an IOCTL interface. Since we have multiple
> vendors implementing such interface, to avoid ABI proliferation, Dan
> proposed using a common ABI for it and submitted the Trusted Secure
> module (TSM) report ABI support [2]. This patchset extends the
> TSM REPORTS to implement the TDX Quote generation support. Since there
> is a change in interface type, I have dropped the previous Acks.
>
> [1] https://lore.kernel.org/lkml/3c57deb0-a311-2aad-c06b-4938e33491b5@lin=
ux.intel.com/
> [2] https://lore.kernel.org/lkml/169342399185.3934343.3035845348326944519=
.stgit@dwillia2-xfh.jf.intel.com/
>
> Changes since v1:
>  * Used mutext_lock_interruptible() for quote_lock to allow user
>    interruption.
>  * Used msleep_interruptible() instead of ssleep() to allow user
>    interruption.
>  * Added check for the set_memory_encrypted() return value.
>  * Fixed typos in comments and commit log.
>
Thanks for the changes, the patch looks good to me.
Reviewed-by : Erdem Aktas <erdemaktas@google.com>
