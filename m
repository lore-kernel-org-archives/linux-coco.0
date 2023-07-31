Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5BC1D31F
	for <linux-coco@lists.linux.dev>; Mon, 31 Jul 2023 18:28:21 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fe1455e7feso496e87.1
        for <linux-coco@lists.linux.dev>; Mon, 31 Jul 2023 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690828099; x=1691432899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cvfVGN64Yz22QUMEBnQLTws3rVwIXcDs5eogAVL6yuM=;
        b=z1d5+UX7XYBLc5qbQyuMw7rWEEKuv2TQFDcTMCZ6OV4JkvucedodvmaabpBkiF44d0
         m/K4p72gyDMp/ymng1FfGjNxxLqdWr4rM+5kOb/xEGRcsc6O5kRrOZ0x99PgeXO5tsrZ
         mXMxNykbv1E4JGmc/iCdFFGCyPi409p4eQVstzRXuL8rBbavGJhkyByuZKOrEDqUQj2L
         eIs1MA1ciAq5BQmFXw9kX/VhN1rYNqGyThqGPy3TXg+9zdJaEH+MY+v5p9dtCnhVa8HK
         SZA2IKzTZ/IA5Ra7Mv9sOeSFLfxzaThxsISmQUv8TDtkYA1VQxtPj9lStP5WTEOk/laO
         sQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690828099; x=1691432899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvfVGN64Yz22QUMEBnQLTws3rVwIXcDs5eogAVL6yuM=;
        b=ej3hvQQd4iRKCU4XcYQvdCCmhx+aJ4dFuFAbPmuo7PspeKA4/WQYKHGHkr8FKegb99
         u8XnXzcHqNEAI6WyLn97Z8Da23ESglr1kt+OYbbKpiK3p0p6UnebxXTdqsK6VsqBKUjf
         LSD64dx0KFSswq5Zr/Qn5IJk/YdszdSKMRy2abXnFalySyoscbrs6b3sUCIPg6H3UfL1
         P/+vQLf6/MkJcCqLX10LMYo+lsuSBA5vbO+fr2oCaeUBx//D/doHVkqKWe9ImKghXFbK
         6HKseK64D4KrN8b6zxur+tNYmEzTjqhGQDx/N8ZyLSKBtk0NATeJ+i/HVZlx2PoD4xJ4
         pUnQ==
X-Gm-Message-State: ABy/qLaDb9orVB57ydCs+vusiyk4A1/a1Xt2OQSBK07uCF7GMO9+3Llh
	jhzEVATKV4iZL9F3BElNC6KZkaD0hEW/4bOHOcULbg==
X-Google-Smtp-Source: APBJJlGXOlSonsATZcgcpwFmcM1bdURp+WkSA0XT9NFQlazdeHmtW8WNMTeMww29uH2H2bA9q7rX/l1S5/AL6zE3Ugo=
X-Received: by 2002:a19:f010:0:b0:4fd:eb37:7983 with SMTP id
 p16-20020a19f010000000b004fdeb377983mr119542lfc.1.1690828099374; Mon, 31 Jul
 2023 11:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
 <169057267580.180586.15710177655506555147.stgit@dwillia2-xfh.jf.intel.com>
 <CAMkAt6r=r_utT6sd_LD-2rO-GpH4zd1D04p04P8WF51BKX-JMg@mail.gmail.com> <64c7f7ddd777c_51ad029436@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <64c7f7ddd777c_51ad029436@dwillia2-xfh.jf.intel.com.notmuch>
From: Peter Gonda <pgonda@google.com>
Date: Mon, 31 Jul 2023 12:28:07 -0600
Message-ID: <CAMkAt6rotv3UtPifmsRK6wQ-Gh0LjZTnkzK-Gce0SdRz-iN+gg@mail.gmail.com>
Subject: Re: [PATCH 4/4] virt: sevguest: Add TSM key support for SNP_{GET, GET_EXT}_REPORT
To: Dan Williams <dan.j.williams@intel.com>
Cc: dhowells@redhat.com, Borislav Petkov <bp@alien8.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, peterz@infradead.org, linux-coco@lists.linux.dev, 
	keyrings@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > >
> > > +static int sev_auth_new(struct tsm_key_payload *t, void *provider_data)
> > > +{
> > > +       struct snp_guest_dev *snp_dev = provider_data;
> > > +       const int report_size = SZ_16K;
> > > +       const int ext_size =
> > > +               PAGE_ALIGN_DOWN(TSM_DATA_MAX - report_size - sizeof(*t));
> > > +       int ret;
> > > +
> > > +       if (t->pubkey_len != 64)
> > > +               return -EINVAL;
> >
> > Magic number?
> >
> > We only support asymmetric keys with public keys exactly equal to 64
> > bytes? Is that only p256? SNP uses p384 can we atleast allow that
> > curve too? But why not let userspace what key type they want to use?
>
> The kernel has no control here. See Table 20 MSG_REPORT_REQ Message
> Structure (https://www.amd.com/system/files/TechDocs/56860.pdf)
>
> ...only 64-byte payloads are accepted. I assume one could specify less
> than 64-bytes and zero-fill the rest, but that's a contract between the
> requester and the attester.

Great, we can then name this const.

Yes that's why typically the public key, any context, and nonce would
be hashed. Then we can include the digest into the report.

>
> >
> > > +
> > > +       if (t->auth_blob_format[0] &&
> > > +           strcmp(t->auth_blob_format, "extended") != 0)
> > > +               return -EINVAL;
> > > +
> > > +       if (t->auth_blob_format[0]) {
> > > +               u8 *buf __free(kvfree) =
> > > +                       kvzalloc(report_size + ext_size, GFP_KERNEL);
> > > +
> > > +               struct snp_ext_report_req req = {
> > > +                       .data = { .vmpl = t->privlevel },
> > > +                       .certs_address = (__u64)buf + report_size,
> > > +                       .certs_len = ext_size,
> > > +               };
> > > +               memcpy(&req.data.user_data, t->pubkey, 64);
> >
> > Again without any freshness from the remote party, of what use is this
> > attestation report?
>
> This interface is just marshaling the same data that could be retrieved
> via SNP_GET_REPORT ioctl on the sevguest chardev today. So I would point
> you back to vendor documentation for how this report is used. See "VM
> Launch and Attestation" here:
>
> https://www.amd.com/system/files/TechDocs/SEV-SNP-strengthening-vm-isolation-with-integrity-protection-and-more.pdf
>
> I am just here to stanch the proliferation of new chardevs and new
> ioctls for this TSM-common operation. This effort was started when TDX
> patches showed up to take a 64-byte input payload and wrap it in a
> attestation report with its own chardev and ioctls.

The way this is currently setup suggests that a user should add a
pubkey with the 'keyctl add tsm ...'. But if a user does this as
described here it won't allow them to set up a secure protocol with a
remote entity.

I think a user could abuse the naming of this system to do the correct
thing by using 'keyctl add tsm ..' over data which is not a public key
and is instead a digest of some public key with additional protocol
data.
