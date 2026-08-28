Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C6B3A1A38
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 22:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787957682; cv=pass; b=cipXOB6re+zL/Ey1DJnCZIKJPRIAe9c3hDIB4ml8VyiV1UletLI13KVpWDk0By8Age/Ls9jG4dp38L4v4dCtQdcxCS/HinOpXt/uXXv+A1UtRNSnnkZAFYmO+mrCFwFsVpqZMXue14CHy9y6/3Y4mnWXYk2TKx+rq2gA9kG9KZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787957682; c=relaxed/simple;
	bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNA9HJgsFXTiTK5sWXiuUvnOgePjbh95WXqKQ5tgKKjMSZNQ6zz4JCJrZ4QBKxswLqL5fU4gWx5pEXJMOWkFZEi+EG8n4aTN1m2Y0a+WCOkUyEaYtuiIFCaIR4b8eT39X3QvTADtryiTM6I6nU+AGVUzwCG9Vhu9tl1OUYhkwSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DRxBlytQ; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DRxBlytQ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52fac937235so45261cf.1
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 15:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787957680; cv=none;
        d=google.com; s=arc-20260327;
        b=kTH22HCRGYEIly0nric/27SVLPA+0VYdLezlXeO6fl8y028iALAeS9naC1apke5smm
         N7YI9Y2950weQLiu2l7BY0q45IGY0qfNQ5Y64Gnlz2bsYlGkDMfW3rO+Exu84VKPVSRk
         Om1uMnvfhNUsYvQDGlR5tTXh4C7Z5XLN3uX8iIKlOv7lEAqY/FqubMP4RsaCSoiRLhwH
         0bGuJzX5kwjKySLQfIe6V7rd7hAtOfX9U6/GMJYyqJvcs8uw5ru+t7MKODZAlxOOoPFQ
         oUJeXvWKmPQaKjoRqUU/YwYiZWnaWBMGfCaWmZ2KMNjyKD+j0OoX0M9YgLekiDbV/ZR/
         eS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
        fh=I/1Aw4cK6vhZKoKE0el106p+2Upck+u7DEciD9Xx2qs=;
        b=gMjJfZDh5VkZf+mSVVMPBEVTAeKxQgCmpogbT+GIFWr9LEFDNwdKDZJcS/gnlq4pCJ
         8I9x4CKlJo9sLouP+Q4g7P/YgCEBDHGs1Vr2lR2fW1aVY9TfRPCUh0oqOmkhFLapkXTt
         wMGY6QmtmNuBEiTidG8ToziNmXOrGic0Px0ResMvWNPq3CSnPNlCdwTSpb0tSYztU0pB
         /nxEaXiwXjluFhD1yZI+EFPzkxNfoMRAP9Br2KjVDEGvjX4JPGGbMH7DWK3UQ3zFp2Hw
         8dQoCIhfjY9L8PCumQhTQ/AcDnNoCM5zcszNs7hFU1KdpTNtE9HdUnR4nduLwNRCCcFE
         0NaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787957680; x=1788562480; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
        b=DRxBlytQJwchczOiJqs68txP/ibLlmJBc2E1GyASBSTy1LgwiNfEkxsOU6VCDBc3Xy
         3uXgAm8un/L8XlMDwy0XbyziD2f//X5u4qVfnXv1I5PXZvdIScjajYbTTfHZQ0LnehAj
         a7aW7alW4WZwRse6HkQj//v+vLG6jkFoHNnm725neFbHcaHOqidC/rgw2xqjBaDlFSG8
         tCdiES0gnyVrJl9JLlkLmC2lmnxAHabf6RIDMe5cKiccoIBZryRxGqMkXo5VRD6U0Bod
         qEa7dkuCMUDldJsdzYZFhJSN56z6d7Z+hVgfqIuWWPCINb9YkrroGhEQwrZGwVlzkMpb
         JMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787957680; x=1788562480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
        b=gEMdwRYObiefus+usU5eVb9F7KZW9qvbU4x0yywXkWu0pqGvsFL0aT6HDJooxK598q
         uWzSPpaFDkZORRnYdVbjUOAx4lMkW9AeYcTyBMlWgjyfaHdfn+krgSVHdl6848DmK8Q5
         KfNsKTvQJgf8M50T3wX2ynPUj2C9aQSH7ZSZIe3vsBwd7vUbuTB2Fh9b2e1j+RnjxoLy
         M5Br5aGZ6YbYAid0F8awgXBIoshLV4YXEgu9h6hWI5PdDu8zUQ5M9VXE8YPcmC1z8HVE
         UzFy4y/WocjAWS4V+ORe0ICjjv7/BSMTKSDNCDoZ8hf8S0OGkRMWJlTiwEY16p3xS/3E
         kjkw==
X-Forwarded-Encrypted: i=1; AHgh+RpvVDkcfTzZdh+GrpcAHQoGIcA/PQinHjIesYdBr4xVHYDVZf9r9pCTqPf73TXIaSoi4n0MtbcwuUxi@lists.linux.dev
X-Gm-Message-State: AFuF++mHu0FgyN2K9FWD6O+bg8Zg4/aBOCUzfgP8tU1IDh/e49ASnJn+
	zF/+o+s4DHXhU7rGi7T/ahQLC5bv8Rl/GdRg8k0RGMd2sOlT+zclNaSPt5Au7Vxk7duMZJBbvNP
	RIzaoFPGirM1OgDJO1ZJD8I5A4UvIEOF0gN5/w/zGnSvKpNCzj5iBWbnM
X-Gm-Gg: AR+sD13+YJTSxxuEol/rsaUsgz1ORE64HiHWfQ8teyImsYkKOwQ/zIuGBFiMlcPKaTi
	pdGAsQF//zrsYVbksPth0fBbUEplkyXFNgu4+Il1SVvo5M6pArpKszkdTq80Tp6K96X1J0oLvKx
	gcsALjw4y5I8CoXRQBiBh1Jt7bNiRe3ktn8pbsUBryYIiLzN6dNfRSjDFmgRLXOdTfLdJWd78w0
	Zo1z9QXQXDSgVoaJliBYAYerV3GlTUj/Vvhz/xrhfacdrrBSL21eLVoTajbNeme6xzd5kuSNsvM
	VohG4LqnEQpzN5v56Rf2x5XOSvZNOmDtFsY4lr7IHB4rAsadWKbKhkvjjOoX68zIeMXdx5C3I9t
	c
X-Received: by 2002:a05:622a:5a14:b0:51c:6b7:d3de with SMTP id
 d75a77b69052e-52ff716a2admr5298061cf.5.1787957679730; Fri, 28 Aug 2026
 15:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com>
 <20260806020850.1221381-4-rick.p.edgecombe@intel.com> <CAGtprH9ERb_fFG-4JYR1Bjxyyvnk3Ys4q=9ioQz0Cq6QCXtVBw@mail.gmail.com>
 <9c0048b72834e7e88cb278476ad8d19f57373aa9.camel@intel.com>
In-Reply-To: <9c0048b72834e7e88cb278476ad8d19f57373aa9.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:54:28 -0700
X-Gm-Features: AcwNN1UEyg9LUIjstN53o3MhfwwMAKPLjXkthRuE3vRI8Rovt7_F8Pac_E2pZ8A
Message-ID: <CAGtprH870raS09USeB=Ec_TAY8Vke6-nV_LcX6dYZVn=wEhjNg@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] x86/virt/tdx: Add tdx_alloc/free_control_page() helpers
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, "Wu, Binbin" <binbin.wu@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"hongyu.ning@linux.intel.com" <hongyu.ning@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "Mehta, Sohil" <sohil.mehta@intel.com>, 
	"Gao, Chao" <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:23=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2026-08-28 at 12:50 -0700, Vishal Annapurve wrote:
> > Reviewed-by: Vishal Annapurve <vannapurve@google.com> for the
> > SEAMCALLs and the get/put helpers, assuming your are still thinking to
> > shift things a bit between the current and the next patch.
>
> I looked at moving tdx_alloc/free_control_page() to the next patch. But D=
ave's
> comment was more along the lines of just commenting the limitations. So r=
ather
> than disturb the already reviewed patches at this point, I'm just comment=
ed the
> limitations clearly. And then removing the comments when the limitations =
are
> fixed.
>
> So the only only code change here is temporarily prepending the limited
> functions with __.

Sounds good.

>
> Do you want to keep your RBs?

Yeah.

>
> Rick
