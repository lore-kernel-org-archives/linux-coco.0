Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA158249ED
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 22:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4KI7w+lX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso2041a12.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 15:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697062912; x=1697667712; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ad0IQMFMc0rh3NO1Cz583Bgcvp6TLEvMfVC876OMCoc=;
        b=4KI7w+lXgDBZkZ1aWffLOw9noNk8g34d1kEcjwZkYkFXtWGKOjYyJ7heNEJVz4Rt3V
         c/MMz2ANNkDC4rtpCpOBwlHiRWsjAoBkaRUM4XMWLoua90H3d5Agh/8njDhdyIG6dJH4
         MJ4vgkjdaWREBVN1XTHSRtxuhL0WvNYSiLvy+24//7gMK1ZscQDGeISVPEh/gwILp8y3
         OrzamIkvnMBcLtQqN98Vrl5ZtkXqVlE+jVzmKRI64osL4iX5zKico1YkfYzpTy6c/KVB
         VAI+/Y5Rfnl+d60560uvMRylgrTfsMl/CLVkzSwJWWxWnR1M6F3u/RNQcOeSJZnNZf3e
         qFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697062912; x=1697667712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ad0IQMFMc0rh3NO1Cz583Bgcvp6TLEvMfVC876OMCoc=;
        b=j7PpNaSoxrswds43McmSoiBsii1xFXYkP7Fr6SIg5D+lxmTFGd1RpRozossdp864xs
         xltBoxZKHiDW/znfaOCEOeY6xto+s9IYZT+iBWymhBYpuHGiTLH1PnzxS8tBhL+SibkO
         EoEafgbDvj02JN8JNyvGZkbP7ecMoWvrmkkMcFyD2IztMYrOI6w9RNImFmOc70GbMiOl
         7nuP2AQlB59+kWaNcKw/JT+SSEUkxLoJrPOZ0fQcRojG7c/OqD1yerc8jro1jiyB6lOf
         MDvWiUmMEzKACZNs9EZ5/zSR5vQcryrADyfOWz6/azMzx5tGNTOJLZUBqXc5FXE2I/bh
         PUJQ==
X-Gm-Message-State: AOJu0YwQISSDVbDe2+6rj/xSnKpKwZP2996S3WJ5JsaY/JZ5Qj1ecE49
	AetOjJB8rNTX5K9ISsQmB/hQDR2dmtXGhTMzQg+8YA==
X-Google-Smtp-Source: AGHT+IFSrCAKbCCl0LujZbbXmQupBNv/055EFfXsHvVqL8NgeScKvBAze+RN7YaWc+2awPY42OBgfhG27ilhFSGdsxI=
X-Received: by 2002:a50:aad8:0:b0:525:573c:643b with SMTP id
 r24-20020a50aad8000000b00525573c643bmr233731edc.7.1697062911885; Wed, 11 Oct
 2023 15:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
 <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
 <9b8d2905-3203-67bc-9d6b-b60023910666@amd.com> <652713f6d5bac_780ef294b9@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <652713f6d5bac_780ef294b9@dwillia2-xfh.jf.intel.com.notmuch>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 11 Oct 2023 15:21:38 -0700
Message-ID: <CAAH4kHatSdJ31sTSqKEEsNYfuhZmn3Z2WGMBLcErt4qTKJV1RA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] virt: sevguest: Add TSM_REPORTS support for SNP_GET_EXT_REPORT
To: Dan Williams <dan.j.williams@intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-coco@lists.linux.dev, 
	Borislav Petkov <bp@alien8.de>, Brijesh Singh <brijesh.singh@amd.com>, 
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, peterz@infradead.org, 
	sathyanarayanan.kuppuswamy@linux.intel.com, dave.hansen@linux.intel.com, 
	Erdem Aktas <erdemaktas@google.com>
Content-Type: text/plain; charset="UTF-8"

> >
> > I agree with Dionna here, you must keep the GUID<-->Cert relationship
> > here. I think you can just copy the full returned cert buffer into the
> > destination buffer. Then it would look just like what the ioctl() returns
> > and make it easier for userspace programs to switch to the new mechanism.
>
> This reverses the feedback from Jeremi where he asked for a separate
> "certs" file.
>
> Hmm, perhaps this should be an optional @auxblob attribute where a
> backend can publish supplemental data to the report. The issue from a
> common ABI perspective is that the SNP report format is independent of
> the conveyed certificates and the TDX quote format includes a reference
> to the "certs" from the "reportblob". In the SNP case that certs
> reference is conveyed in the ioctl envelope which does not exist in the
> configfs-tsm case.
>
> So the proposal is @auxblob is documented as supplemental data to the
> report, and then when @provider indicates "sev-guest" the format of
> @auxblob is defined by 'struct cert_table' in GHCB 4.1.8.1
> MSG_REPORT_REQ.
>
> In the @provider == "tdx-guest" case the @auxblob attribute is hidden,
> or empty.

auxblob might need to get added anyways, because the quoting enclave's
embedding of the PCK certificate isn't through PEM but a decomposition
into big endian integer pairs for the ECDSA curve.
This makes extension for a platform maintainer to provide cached RIMs
for things like trusted I/O devices and vendored firmware much more
difficult.

I would need Intel to comment more directly on
https://github.com/intel/SGXDataCenterAttestationPrimitives/issues/336


--
-Dionna Glaze, PhD (she/her)
