Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EE1C15
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 08:04:20 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-402c1407139so7750805e9.1
        for <linux-coco@lists.linux.dev>; Thu, 07 Sep 2023 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694073858; x=1694678658; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g0UjxBFHJdpbfokvZNtbG8hLH/h565oIkcGkrz9vwfg=;
        b=KltDB6pujeRx0f8ePIZwh8RGbcp8Gg7zyXcuWcqIJGHZebTpJoHsZ7QcND/S3V8fPc
         UYfPBN60rLuA51tDlwPbYtMGCFT7DVmZsssmVC+Zeb87ukMx7BF55sDeyfE1dpr+raoG
         92fHVpQGw83wNeYZIVRv/BH7xNz4yigwVt2iQ7JlpwHs5x3khYOpxgJj6D4YgF9e/jGG
         9XNq+5u4v1QUZSzkWZLOHSVD6AVouC8JqFOIk9tiqhOfliJKrlASXKlijeHc04MzjIaB
         cb4HaFFRAaJhiSEY0GF26NWuJr55iO6NXwNrp7GPv/HBwT06RoV+F/fIkJEVZKfJ0oa+
         ajVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694073858; x=1694678658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0UjxBFHJdpbfokvZNtbG8hLH/h565oIkcGkrz9vwfg=;
        b=LAs7CKilzw9sFDg9jK5niFzOKDhkFNm6p4omYlQUW3Pnrkr7SuqnZ5tuCgsksVDnXa
         uOXgoAgg16qNkfU6KDkp+vrbAOvyKnTSyS05pcqMKmCvxr+kecKE3rlrIy18oTfUIPAi
         xmEDtdy7wKvRwkkm6t11lK8TJE7Fj9OWK25V+iHEHUhqCoSW8XGa3Si3moP6Nh81vqzy
         BOd3EeA7ssBxfKTi5gX7UTyYHNIpWoKkv5ch7VoIlBbR0Zy27FX2AdAnguxHrMCYzyB4
         NAl/YVknz5ymrpe+8rXyUe7vRcTk30t7jY/sCJAecMyBG5f1LcSdGs7ns83IPxs4MKKj
         vX+g==
X-Gm-Message-State: AOJu0YyOKzlBGZR7PKrpQbQmasmGTv7xQ0ZXl2/yg0xqJPLQJ2isrRy4
	JuJBmszAMEf7R153J0wv2ZhL5w==
X-Google-Smtp-Source: AGHT+IEalu9zCtoYR2Ui9Q1qU9PRb8tCGZA9hsrK25jqKWgWWlg25b2SfOAY9X9gMnN6g7j+XEme9Q==
X-Received: by 2002:a7b:ce8a:0:b0:401:b0f2:88b4 with SMTP id q10-20020a7bce8a000000b00401b0f288b4mr3852711wmj.26.1694073858569;
        Thu, 07 Sep 2023 01:04:18 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id q20-20020a056000137400b003142c85fbcdsm22695767wrz.11.2023.09.07.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 01:04:17 -0700 (PDT)
Date: Thu, 7 Sep 2023 10:04:15 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
	linux-coco@lists.linux.dev, Brijesh Singh <brijesh.singh@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, lukas@wunner.de
Subject: Re: [PATCH v3 0/5] configfs-tsm: Attestation Report ABI
Message-ID: <ZPmD/xJic2QrfIf5@vermeer>
References: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
 <080d834d-9ca0-437f-8f18-b7a311af0060@linux.microsoft.com>
 <64f2169e5c381_4c1f329451@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64f2169e5c381_4c1f329451@dwillia2-mobl3.amr.corp.intel.com.notmuch>

On Fri, Sep 01, 2023 at 09:51:42AM -0700, Dan Williams wrote:
> [ Add Lukas since 'SPDM' was mentioned ]
> 
> Jeremi Piotrowski wrote:
> [..]
> > > An attestation report is signed evidence of how a Trusted Virtual
> > > Machine (TVM) was launched and its current state. A verifying party uses
> > > the report to make judgements of the confidentiality and integrity of
> > > that execution environment. Upon successful attestation the verifying
> > > party may, for example, proceed to deploy secrets to the TVM to carry
> > > out a workload. Multiple confidential computing platforms share this
> > > similar flow.
> > 
> > Besides the platform (cpu) attestation report, there are also attestation
> > reports from individual secure PCIe devices that we'd want to fetch. This
> > uses the SPDM protocol[1]. There is a CHALLENGE command which (too me)
> > roughly maps to an attestation request, but also separate interfaces to
> > fetch individual measurements and certificates (like the SNP extended
> > report interface allows).
> 
> Yes, but I am not yet convinced this configfs-tsm interface would get
> involved there.

User space will want to get those devices attestation reports, and those
would be carried through the TSM. It would be nice to be able to use a
common ABI for this. A CPU/platform attestation report is not that
different from a device one.

> > 
> > If this is to become the one attestation interface then we'll need to
> > consider that. That will probably require adding a second level
> > directory: /sys/kernel/config/tsm/<device path>.
> 
> The SPDM situation is different in my mind in that the kernel has an
> interest in being able to attest a device itself. Think of cases like
> power management where userspace is frozen, but the kernel needs to
> validate the device in the resume flow.
> 
> For TVMs the kernel would validate devices

That means the TVM kernel would be provisioned with reference values and
policies that are likely to be tenant specific. The same TVM kernel,
running the same user space stack, getting the same PCIe device
attached, could either accept or reject such device, depending on the
tenant/workload owner policies and acceptable reference values. That
means each tenant would have to build its own guest images, and maintain
and update them with potentially each new device or new device stack it
wants to support.
Keeping most of the device attestation stack (similar to where the
platform attestation stack lives today) in user space seems more
flexible to me, and allows for tenant to use single guest images.

> and the verifying party would
> validate the kernel as part of the guest measurement.
> 
> The main difficulty again here is evidence format differentiation. My
> hope is that there is some standardization

FWIW there are IETF driven standardization efforts like e.g. EAT [1]
that go into the right directions imho. The latest CC implementations
(CCA, CoVE) follow those specs (EAT, CWT/JWT).

DMTF (driving the SPDM spec) defines also its own format, through its
measurement format spec. Device vendors may choose to implement that or
to e.g. add their EAT formatted attestation report in the reported
certificate chain. Realistically, we'll have to support all of those
flows.

> or otherwise a way to update
> the kernel's verification logic for per-device evidence-formats.  Maybe
> eBPF has a role to play in that story, but that's a converstation for a
> different patch set.

This conversation will hopefully include a user space architecture.
Potentially something we could talk about at the CC LPC microconference?

Cheers,
Samuel.

[1] https://datatracker.ietf.org/doc/draft-ietf-rats-eat/
