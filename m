Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38E412E5E
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eyg6RZNq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4053f24c900so8145e9.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 14:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697058400; x=1697663200; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdaRYwsxFZADEFGrZEFinGEr7dQqPhOATC4YsWtKxfo=;
        b=Eyg6RZNqyRewlRZXR9ZidpjEMCh9If4Iavun4IN5M6tQRNGHET1EhF6kHcyGrwXnbm
         zWsRkFk3O+cTWmwm0a/GftYFnRWrlUWbXG0KJtnfcjx+RMAluCjBJftLBbwgVGKelUpP
         0ljksJW0TRWwugZapE8wnvOtKfuOB4t/qAm24RLPu9jADdkgfP4rFtUQL9rUeY1H/2I9
         CAiOkNIGCU0Q+bjPgwHo3enggdb7K1NGCdaXZTVZO2J/GcQlAMY/RWH0ircPKg7375Mk
         xPfIG1oi5gIu3EjK98cdl6h6+ybIpJPH1PHgbogtNEU7qg9nz2iv3GJ/2FuYgUJv+Fd8
         EEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697058400; x=1697663200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdaRYwsxFZADEFGrZEFinGEr7dQqPhOATC4YsWtKxfo=;
        b=Q2kU5u84+nT6t06JNii4TOTdJ1KNJnlJxxgD8B1QPVlc+clxvJa9tCbgTNaTLYN105
         oG8PvPmrBvMmStmEaHruQ/6aboifZ3CitSY5m1AwoaUCm0n5Hplm8KhZ60moUHZgstzO
         foiFayAXRuGEZZTh+6PPjurpwzyVI8A2A2LtOhbKRdfQVmddMIic/dFNvpw+JuUQYatT
         0TAEnwWhDOVt4Li05/6H9Kn8UUIuoTYyATzHRth4N5WB0us+NSSKtKbPVJ1yP69006Bg
         pBxx/GJRm3mZ1WIHSCIPqX1cT4iq8vNuCa3ebJwv1uYzvWjJSNgC/Q507skSmx3U5RvS
         FlwQ==
X-Gm-Message-State: AOJu0Yy8ACNxSRMSkfHmu/LDRMSs/CF/r4bVxAkLyFyw5AD5YgX23Drm
	4wAlzavHJ3DgH74zafgUcGBBpTkodGQFRcb99JRhsQ==
X-Google-Smtp-Source: AGHT+IHXQKRo7l6mgwb4MBYFnaY54Eqq/oOcs7p0XQfUXRKghtWFzBy2piK4mfj+cWVsHQvPGDrtS+7n2H/+5dg7ePs=
X-Received: by 2002:a05:600c:3c96:b0:3f6:f4b:d4a6 with SMTP id
 bg22-20020a05600c3c9600b003f60f4bd4a6mr151290wmb.7.1697058399846; Wed, 11 Oct
 2023 14:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
 <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
 <CAAH4kHZkWYT5i=5EVqywh7jk-00kcXu7h4vbz24fTwAm42frVg@mail.gmail.com> <65270896e90f3_780ef294c1@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <65270896e90f3_780ef294c1@dwillia2-xfh.jf.intel.com.notmuch>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 11 Oct 2023 14:06:26 -0700
Message-ID: <CAAH4kHb-V8q14L+eJh+iTYGwu10-MQ6maR48U5wJRC_bgktEbw@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] virt: sevguest: Add TSM_REPORTS support for SNP_GET_EXT_REPORT
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, peterz@infradead.org, 
	sathyanarayanan.kuppuswamy@linux.intel.com, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 1:42=E2=80=AFPM Dan Williams <dan.j.williams@intel.=
com> wrote:
>
> Dionna Amalie Glaze wrote:
> [..]
> > > +       /* Concatenate returned certs */
> > > +       for (i =3D 0, offset =3D 0; i < cert_count; i++) {
> > > +               struct snp_msg_cert_entry *certs =3D buf + report_siz=
e;
> > > +
> > > +               memcpy(cbuf + offset, certs_address + certs[i].offset=
, certs[i].length);
> > > +               offset +=3D certs[i].length;
> > > +       }
> >
> > This concatenation isn't going to work
>
> I will note that v4 had this as well, so the timing here is not great,
> but the feedback is still important because it affects an ABI decision
> and "ABI is hard".

Yes, thanks for taking the feedback.

>
> > since you lose the identity of
> > the certificates. The GUIDs of the certificate table matter, and the
> > concatenation isn't necessarily easily parsed out.
>
> I notice "isn't necessarily easily parsed out", leaves some wiggle room.
>

Yes, DER certificates can be concatenated and parsed without
additional metadata,
but I'm less sure about other formats. We could be looking at COSE or
binary-serialized
protocol buffers. It's an entirely avoidable complexity.

If you want to keep PEM, then you'd need to interpret the GUID table
and do the base64
encoding yourself

> The rationale for the concatenate proposal came from the observation
> that conveying certificates is a common capability between SNP reports
> and TDX quotes. In the TDX quote the certificate payload is a:
>
> "Concatenated PCK Cert Chain (PEM formatted)"
>
> ...so the thought was unify on that common denominator of "concatenated
> certificates". Is that an oversimplification?
>

It is. We'll need to get the quoting enclave to additionally provide
an integrity manifest of the firmware.
The TDX team hasn't implemented this functionality yet. Intel told us
this is the pathway we need to take.

> > Consider our use case of providing not just the ARK, ASK, and VCEK
> > certificates, but also a non-x.509 document that is a signed golden
> > measurement of the firmware. We may also want to provide the VLEK so
> > the endorsement key selection attribute of the MSG_REPORT_REQ can be
> > utilized to swap between VCEK and VLEK. I don't believe your patch
> > here allows for that selection either.
>
> To date the kernel's snp_report_req definition is:
>
> struct snp_report_req {
>         /* user data that should be included in the report */
>         __u8 user_data[64];
>
>         /* The vmpl level to be included in the report */
>         __u32 vmpl;
>
>         /* Must be zero filled */
>         __u8 rsvd[28];
> };
>
> ...so the design was only considering what was called out in the existing
> ioctl ABI.
>
> When would the key-select field of MSG_REPORT_REQ be non-zero, and would
> that be a per call decision, or is that selection a fleet wide policy?
>

This is more of a customer-wide policy or machine pool policy.
We have some folks that want VCEK endorsement and we have other folks
that want VLEK, and sole ownership vs fungibility for that choice is I
think is not where this ABI decision should come from.

> > By the GHCB specification, the host is allowed to document their own
> > GUIDs and provide their data to the guest in this data blob.
>
> What does the caller do with these certificates, or are they only
> conveyed to the verifier?
>

The caller could do anything it wants. They can be forwarded to a
verification service, yes, but they may also be analyzed locally and
added to a database for manual review provided some criteria are met.
Say we have a user that is skeptical of any new firmware and rejects
any document that the VM is not preconfigured to accept. This is a
kind of verifier, yes, but it's not RATS.

> > I think probably what's better is for the configfs to just create
> > GUID-named files with the contents of the entries, but I don't think
> > just inblob of length 64 is going to handle the VLEK/VCEK selection.
>
> That's a possibility. Would the kernel need to invent GUID to represent
> the TDX quote PCK cert chain, would the kernel need to un-concatenate
> that blob into separate files?

I don't think that Intel plans on utilizing this "certs" outblob since
it includes all collateral with the quote.

--=20
-Dionna Glaze, PhD (she/her)
