Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BBF3CB2FD
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 19:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945339; cv=pass; b=eaKQ9Puru40A8cq1bbZlnpn09jVRwg0qxIbk7/IoDs3pTYiSc5F17/momAdvuH6Gsx5Um0s44pzyHtTsC5Ozc+8UZ2/cuEJ7J9iI1KrATm+NCWudYunw/Sun6IDwV2K58aU5Kd8UZa8fhOUDQIfhEmDDxkugXKi7+FuNT5xC6fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945339; c=relaxed/simple;
	bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+buFRZCpIt3ZRhGLvNyrrpOL82ArvUZoH6cgLXQyXIX2ScNWjQWeg1n9Pm6V3ZU3lVS72Kq3NIMBY6Yu6DUS6cqdN7vN+aVN3ewbzRugbiD4QXJa+jIHVT5XzMNCaPyh/lKXiKGtDd/hdIT46JZ4WZWqwzrNMHKe1DbLLnkGic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SYfs6joO; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SYfs6joO"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52faa58bff5so40651cf.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 12:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787945337; cv=none;
        d=google.com; s=arc-20260327;
        b=JOeVW3LbRLOFY/HDQksLHJ2AxU+Tp+4IO8tld8NR1hiT2dqskkwTqvzvOAEsn3JNgf
         PAV7NG3HoObgiS8txqhqyWJDqtk/BrriwouY3cKjq8FvKPniIVzep0LFwpWGHBTZOsxC
         Oy3mdzSHJD4UIiSvJm7cODe2Nfk4p/l0C3+h8U60jn1T7db/ONQih9LWfs/Ryci+E+wW
         zmRfYGU0htq5c0b8IJVKtnfk4Jh6sIe5PU2gjH7pxcZp/fj2CL+nI/IaXndBbL+hiiSC
         Dg4f70KGSnj31sBReyVbobNyAR3MwqgCo/QBEIhiXH2KXtbkpuuM/VzSVcsgSG/QO9it
         ZGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
        fh=S5hTqRAybCFPiHejg56u97qNLrHCc29FVtwjEyUzUyI=;
        b=Jk+Js+oE/2kItDuwxWok2cR1Lyc4pMy81dmxz+arSZVd9b2Bwtc+25jcirwphfrM1b
         SVjj2B60Uc7f2n4o1wqTYWO1hCs0CEIKlHACrDLg/CF2a2mE4en/sgkPfqCo6TAR/+uz
         m05cECPgj4SP3oTg6LQQxFVbXkMfrEnTDmeDzq9b9gfIGrfgYpPTL8YnvF9w15gNVY47
         qEt36+FMzvwXPpfrYPa+mAl/wjrbhvQfrN5Qm1XGsEt688873j6mEv7Vwfug84Q4KEgV
         Wn0+qcOdSQZfd1vCOXmoBg0DzkeMSyTyY2vDVqkBdzc3S2ZGVhVNlvclWGq5B41z6hww
         1HEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787945337; x=1788550137; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
        b=SYfs6joONZZbARdb1vlq/qsZnjHAj8VOByvpwZMcJtTV8gxRjll+QKAgph9Dy0P2T7
         I8srTlimOe1qUu23uC0b7eQOahhbZVmGKeAugqQSxmtkdyROJSm8VO9jrZMtxzX8RRRP
         9oHPFnGkZ+Hi7GAFBpSLWLG3J3mEmmdmKSaORCuBzLVlSiZ38w1IUyKw2edSM4IQC6vm
         NZvqiJhOR6SteBQsJc1CF5/vKorTx+3d998N4Qy9X15Jgn6qa5W1g9bc9wa88wgyhky8
         6AgW7xt+ts8jmlP89uM6VAeQBLFUjvu7N6banqBZSS12IVSlnBoXCuO/XD54F3vXI5DC
         ZrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945337; x=1788550137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
        b=muy4XsdjjJ4s6kXOirq3f3w2s3VAUF0HXVe6Cf67i0pr1C2Gmx9IqfTqWuWCZCVa/q
         EFcZ8XOolhi5ni5n0kBeoi0N2Uy7L8IATSpx5YR/xE2QrTLRSVTRhQpTRxsIhJOSVxkG
         /mXNzjbKu44AClq6+QVmC6Ga8VBBtbd7/stnDBLwEo2EFE0gRE5tr3x1K/9U1icO2l8a
         s/bCLGUHlb2u9Pvjy9eIdaCamfg1k8qrY7lTYjFCy1ifsmC8wdNjkG+63y22jcAv9BvT
         YjpYO0RH5O+lTS+oRmhsw8J0N4PCmnoAwFSHUY9qbaVOI5hqFv/4on3MVhHcmC/UMiHF
         bJ9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQTYvafvnx/OSbUd01GenPE+oquBPNPPzhB+L/4Z3kO+WWXKQlVoTaW01UmikesAUq03/jmP3yItrY@lists.linux.dev
X-Gm-Message-State: AFuF++lV8lFml0iU1Ee1ixDgSa/7A8L16LHdYtlDaO2S/wNSQ4Z2tb+/
	Bz/QthjmM/xi9dZKzI5vdd5uDmGxrGoqePhlXMEyC28Ci4J7rKJ5RHEgelp/65kA6Ba+UzZ8l81
	BfPZChhrUgKsL/GHeUYXgHGUnn8B6PQn27SoDlaga
X-Gm-Gg: AR+sD10A3VWVEk86DLLf3FSMRZiklQJNqBSKKDoDd731Ds223kA3FJXscKKiWfpjIPP
	yNTvMR/Oiy7Fkn5vOBSY4KuYZb5e++5k9fTKG13TRwMhBX/VSyS6YLX7/dlZRdOg36d4G+umN3I
	QQlctti1SkOL9NWs4v3e1xcJ+Of/2ObXzqbVR+1AJBgdeBbTNE7Gr6BPxV0n9ROiXq5skfYPt5V
	LRuMWzL9xOWPnsOSTZSu+nL+aUg0kdYrduTDLVD1a7oZbIcHg/uxRBdiqBZ+2R6ivd9Qo5OYrp7
	7sa3ov3gI0OrEn4waFDMDfhP56RKne14TpcnqZQeHf6KwOrblkrvRcyCAQ2wdhxRPK7ihJSrI78
	=
X-Received: by 2002:a05:622a:c18:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-52ff715be0cmr2273411cf.11.1787945336495; Fri, 28 Aug 2026
 12:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-2-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-2-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 12:28:45 -0700
X-Gm-Features: AcwNN1Vl_L43jPWnHgUrkMtGPi--G2PYnVYEwuFbR2C4J7lwt5ES-sPxDWtK__4
Message-ID: <CAGtprH8JLx886qA4rVg5vCKg4M3u9sdEfPig_CtL1kbfvj5B9w@mail.gmail.com>
Subject: Re: [PATCH v9 01/11] x86/virt/tdx: Simplify PAMT layout calculation
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> For each memory region that the TDX module might use (called TDMR), three
> separate traditional PAMT allocations are needed. There is one for each
> supported page size (1GB, 2MB, 4KB). These store information on each page
> in the TDMR. In Linux, they are allocated out of one physically contiguou=
s
> block, in order to more efficiently use some internal TDX module
> bookkeeping resources. So some simple math is needed to break the single
> large allocation into three smaller allocations for each page size.
>
> There are some commonalities in the math needed to calculate the base and
> size for each smaller allocation, and so an effort was made to share logi=
c
> across the three. Unfortunately doing this turned out unnaturally torture=
d,
> with a loop iterating over the three page sizes, only to call into a
> function with case statements for each page size. In the future Dynamic
> PAMT will add more logic that is special to the 4KB page size, making the
> benefit of the math sharing even more questionable.
>
> Three is not a very high number, so get rid of the loop and just duplicat=
e
> the small calculation three times. In doing so, setup for future Dynamic
> PAMT changes.
>
> Since the loop that iterates over it is gone, further simplify the code b=
y
> dropping the array of intermediate size and base storage. Just store the
> values to their final locations.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs.
>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
