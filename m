Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830EF2F33
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 22:15:13 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id a67so27242756edf.12
        for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BLHJ2TVG3TB1nWRSy9ZoDL9L0/fSRT4BT/6XuOCEAI8=;
        b=SY8fkGW0FU4tCwBtvI3xN2dYf8bVOVmfcrjiGaeJvws8B4Ab9m/9go22IQJMBcCIKV
         i6gUKLITbEu/W4opbnrc05WaYwVor4OqcRuxHVrXEwHNA4WRS3zd4EPFDNfLM042fci8
         xb2zPJSO9pj/etaYcNe4rOt2nKwiPQyd/NbAoHcN3eILiNWuWsn3dCRrQEOmB44dtn8/
         GYHAisAcrVmtpVyNNcMBnFI6E7woUUNOOa6RIOBjUCqFw6tXnMh4sbR74OrNsSEc/D9l
         bjhmbGg1JU0aQfvFEgbgB252A9b2fHUNYMVtmQQysLKX5lAn2D9djgO5SnzTQpRrM0Ub
         KfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLHJ2TVG3TB1nWRSy9ZoDL9L0/fSRT4BT/6XuOCEAI8=;
        b=RuzscwhvVJvxPPiqBE6XTJXIJg/cLudB5I3gKfVuK8jYj5aLwrLVSuzLVrVdo/dcD+
         a3rBHxAIrUgZxg/KfYx+nZUe30fil7D4R5PTqJ6kbp/hW0VP8Dxzr4NVS4424eIZ1J/U
         sqpsgVaNi/E3T/L0aa6h35ipcEavZna5knkf10B1hzbKJwsMOTrWyzdBVJrj5pWbKfvC
         FfPrgoe/uHx+TgEzU3kYt6O9rY5B+V8I6t7E6hGHNMBcIM/uw37RcL5XepF9S8u4mXfY
         4HxjzQ2rHintPzXwxDFUy3f2FkF/0QDPJp3/eDOLipjik6dg8t1xRkbZzbFiNcWmwdyI
         kpuQ==
X-Gm-Message-State: ACrzQf051/FPo30gVIEx4XTojvzy5rDtLazeJZKZixpqxva0SlgMUcOy
	j3RLgxBR9NJIiNDkbW5utX6c5UbEHecYS76Cd/l03w==
X-Google-Smtp-Source: AMsMyM76ZQxR4CM+0CLxTCRuqGb7KdTb5oH0zXZoNpsd2YBxR53MvIKi7+1Mgw52G15FstOgrJB6l2dVpLGrqqA/OVM=
X-Received: by 2002:aa7:cad5:0:b0:454:88dc:2c22 with SMTP id
 l21-20020aa7cad5000000b0045488dc2c22mr9493759edt.352.1666217711636; Wed, 19
 Oct 2022 15:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com> <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com> <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com> <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
 <Y0+wcWgcRFTiDTNk@redhat.com> <b8f0c4cc9207a516f63958c53a5a57148606cc45.camel@linux.ibm.com>
 <Y0/2D93P/xgp1sU9@redhat.com> <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
 <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com> <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com>
In-Reply-To: <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 19 Oct 2022 15:14:59 -0700
Message-ID: <CAAH4kHYT3uvqypi8XsrSeLzES8ncO_DRbzSdA1zF=csj3QyB4A@mail.gmail.com>
Subject: Re: SVSM vTPM specification
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	James Bottomley <jejb@linux.ibm.com>, Christophe de Dinechin <cdupontd@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

> >
> > Hmm, do we need also something like SNP_GET_EXT_REPORT which also
> > returns the cert-chain stored in the host kernel? Or modify this call to
> > also return the certs?
>
> Yes, good catch. I believe we do. Adding two more parameters (maybe change
> this to a struct now?) for Cert Data GPA and Cert Data size is the way to
> go. We want the Cert Data that is associated with the attestation report
> that was generated, in an "atomic" way. Once live migration is available,
> the VM could theoretically be migrated in between two functions calls and
> then the VCEK wouldn't match.
>
> Thanks,
> Tom
>
> >

I thought that TPM2_EC_Emphemeral would get the EC public key and
Tspi_Key_GetPubKey could be used to get the SRK public key. I might be
mistaken, but I believe the TPM has commands for this already, so the
vTPM protocol doesn't need an extra entrypoint. The TPM keys shouldn't
change through live migration, so querying separately should work.

-- 
-Dionna Glaze, PhD (she/her)
