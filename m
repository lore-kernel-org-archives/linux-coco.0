Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82F321A3
	for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 18:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ofO+fwE"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507a5edc2ebso392e87.1
        for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 11:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697739169; x=1698343969; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tN/QID9cc0jkDgennPgNqN553NorDTrwYSpcR2QEvL0=;
        b=4ofO+fwESedBYC1GsANTjmo4qCpc1ZRz4D4Zg/eF6xFSCm+6BGv2j0NtUodKToEGHi
         MZ6uMPTDTq2ekoyzuM1vfhk7xAQ8lV+CqY6W2bLNKpj0mSRudfMHCK08xx548EjxNs0w
         Yb4kbQM3nZmhLj3dYHBKGFFIHW2IF4zD2pMR2xBOecW6bs+OoaRsBvYaNLQiTg9oJt5h
         CmRQXl6qZxlId9mFT4EkOCQhkCZdtYN7n7N3ND4elt2T3UVcuZvxG6ifO13IDdzRqnEk
         5Ho6BEXU9N/Env6dLA3WFxO1cxw5Gw48ERB7zkBC66Vs82D64z+A7tW95C6urVOVdxPv
         vaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697739169; x=1698343969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tN/QID9cc0jkDgennPgNqN553NorDTrwYSpcR2QEvL0=;
        b=pyOhv3fJRXwQch7GedE8cd0qFcqtHDj7pBK1lox8yA8dGVXz5xUz7MavEOFx3smrFg
         mXmkytWW3urFASUCHL1G9/2+2o0z85fB9GNMtUBtuM96GA50ZSThVukZQeXK5Ucdgb1p
         pWF9YaeFsbgtPOJsz1/yQnbzL7lpOHIT0IACZ7Fp7kzWkxHRuTVZQPVa1qi6tIfjRy5N
         x2cj9HxfMwWJ7MtAcwi8+jfYyRDBt6e3A9fNqIeYae8gbrTCDMwpGWGXQnfjGl2pApJT
         L2/euFw1M45L6Q1WvtFblRyFb0Opgw0KmGdadQboDjbJVQZ+Xj+kAN94VKKxyqLHXHrI
         GovQ==
X-Gm-Message-State: AOJu0Ywsb112neFFZbKQ4EL9/C4MbSybqxciDdCuR+egu5aw55KPsufu
	q7LSB/q7rhbkG3/0PWkSktUsPVqAR8FUXvYKYQamOA==
X-Google-Smtp-Source: AGHT+IHLIks+jFZgZuiuDIpVoG6GllYrGLpzE+Y2pdAyuvs6OsZD+uHy7qoxhmjjUsPZ9U5jIlx1vGTRU3CR3YCOzWs=
X-Received: by 2002:ac2:5e6f:0:b0:501:b029:1a47 with SMTP id
 a15-20020ac25e6f000000b00501b0291a47mr6062lfr.1.1697739169061; Thu, 19 Oct
 2023 11:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716327547.984874.4293302721471522858.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <169716327547.984874.4293302721471522858.stgit@dwillia2-xfh.jf.intel.com>
From: Peter Gonda <pgonda@google.com>
Date: Thu, 19 Oct 2023 12:12:37 -0600
Message-ID: <CAMkAt6obkMy0yL9B=RO8bYz+bpNsORJNQNbGuwhWBG2L=Y=xDg@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] virt: tdx-guest: Add Quote generation support
 using TSM_REPORTS
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, peterz@infradead.org, dave.hansen@linux.intel.com, 
	bp@alien8.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 8:14=E2=80=AFPM Dan Williams <dan.j.williams@intel.=
com> wrote:
>
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.=
com>
>
> In TDX guest, the attestation process is used to verify the TDX guest
> trustworthiness to other entities before provisioning secrets to the
> guest. The first step in the attestation process is TDREPORT
> generation, which involves getting the guest measurement data in the
> format of TDREPORT, which is further used to validate the authenticity
> of the TDX guest. TDREPORT by design is integrity-protected and can
> only be verified on the local machine.
>
> To support remote verification of the TDREPORT in a SGX-based
> attestation, the TDREPORT needs to be sent to the SGX Quoting Enclave
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
> Reviewed-by: Erdem Aktas <erdemaktas@google.com>
> Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.i=
ntel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

I was able to test this on an SNP machine with VCEKs provisioned and
handed to KVM.

Tested-by: Peter Gonda <pgonda@google.com>
