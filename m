Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528993C76BE
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950760; cv=pass; b=WYSNAcxUFYK/1xnjtA7CrrFctdM7ba2QggT3MqjGICD6EF2IARm5sv6iFpNX2nMd4qz4maLjz81twsRu2KkFyGcsTVMZE8AETZDQTSR/WZbz3Z+aLdyITQxoId7LOP+85wLQcl3O9xZ1wt/ygjQQn4CuYOT7ww8KARydNewv7G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950760; c=relaxed/simple;
	bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wv7wGqKLNwVkevYYqaBAB9cFYTmM1QPgnVHT8bvmiFlnHphxZMylrO049dde0nLT0NUfeVubr4jBaaoDJ/qTQ+CoRWmLBV22UmESts3iX1sMID5f/6modhZy3+SndEnfwkUr9iGtZOL4x1VKV+R3t4Hdrm6KdAtyR0LgXoRC64U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Op3I28wr; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Op3I28wr"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52fac937235so21761cf.1
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 13:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950756; cv=none;
        d=google.com; s=arc-20260327;
        b=EAhZuuH9AwP5o1wTTmmkZjYHMq6rVQrn1/ahnBOsQ8SmKfBbLvrshCaWqOjYGIBFpY
         hycRGUIOLxeK/BwvLBGOee8LPoQ6xZZMZ81ObS0JKkpkO66bIHHQTD7589XR5Q5N5woK
         JTPs1ZoHgwjYpc7jlo8976xNUg1aje+FM72Ffm77v+/nVvaCh0YvNpUdgXMRaj1tsiMF
         1A8ngC/KeY+7B9g4lwcwtrJtINHYpRy4F2fLhml97fjOkog0gnImImrteLU9si5V9i9x
         cCMLqzjD3mfv6tYdK01qudInRfV1QgOQduaIPsV6i/x++gfiBzQ9zHbOoON6Gz0ncPCR
         yQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
        fh=t+TfrlpUcAkLqijKtIcIAUFgrXlpdXTpacDxe/gSDg0=;
        b=J50LMvl240XTqe9muWgaYretI0Y5ldVvGN8/ThMIjteD8LR3srMg6F4AaStcek1eqA
         YXvenZ7sSV2F2tAMVF5O+CDJljUy54Mpa9uJNPTOeQOIZeCrnF+U+3vdN9Sf6ewY8zFd
         AKOhqx/mGfUTbYrOvW36bWkV7/4ghAXNsRKLi14LE3v7Qr8uIBh5TNF/d+U2TCagX9QO
         UnWJQ6n6eOrcnQuJwL771xizxTjy5bLcDaXCOkWlGP5GMvww5lUc6WAs9kWsYX4ab9Lc
         tn/3VX8QDo0htFya2NF29FasJDhBbxdz1LmLHrQ3WXyrPlWzJAB2o1iBgKGxOXbmsB66
         zwJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950756; x=1788555556; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
        b=Op3I28wrppHTWRIMIpsPksXriNLYVHJ1tAQUtkAUY8D7tWWx6wAik4eSvtXVuSegT3
         e1qINz7UUktDkMdZj17xvEOHCVbQNnHRIwFm/kCIAT18T6RmlAMxC2lFut4XyUrkcR2n
         Op0t/5UPZN5AzJQ5h+rAA+uHkyzMP4GJPwC8L7rg89SDqwWtDNSK6eIl+B2ZGG/lNY7V
         PbmVyOZh7V7p7i7gquhC0H4vDdoCsUf8XVNyF8S15EkokGakFtttURYqsd6u2MYA2BJd
         0v5pq2dd6RdcjU+TUMSYNRBFbUIocTM6bkQb2+TMPySAi9bHmOP11boQK7pVWlQMJ+8f
         y15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950756; x=1788555556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
        b=SIdaYJePtXbTMcPh3kCzjY6w0jIdzU9K3dVd29Li0hDugwryPS/Vefn946NGtcQ5Ih
         OJbIyxYQnY5OB6vCPqsKvWHpQBugN4VuS7Ly/dmI0H6wrrllCmOHNy7mbZqE7sY6GPJ/
         NX6vqh/6VGpF07sRWBmG5TLdiw+tZzhFU4lCZlGSE++qqkofUKr1/liU/x3EKHfoFPIK
         yctFz7s0AiGnzb8nSfDkwv2fmZnhiaJfUWhY3frUN7SDSddmkIA+IujEQNNvRjLOh3iJ
         b5lBx647rSwFlsNV35b2dxqHBiPjHiKTe5RSLQ34OSSG/tWzBAPGZicxnR84s3puO2hu
         PEIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrS4BE0q0Mlrlm/RXSlZu3CxZW3PhsW3RuPlXVcVeCxJAmuUZkYAQ3Wkf5YErv3N4Amt0QUTeLsjU4l@lists.linux.dev
X-Gm-Message-State: AFuF++njT9/NTFtUK5tAeZ63t2F1nV0QPFcLlA1QinuKynGYNoItHdKG
	HzTaMR/0w1mXqi7/1mYKm2eQZJzR9xojO5i7xslGNAOFv1ff3RuCrANqy+auWO/mDcEkLaMwfgw
	tlPUxP1jkPHUvTwcBu+5MxTq7p4lSVZOdo2iPbs1J
X-Gm-Gg: AR+sD12mHmvegmrgMyqFIdjxN/+Mc8TYX+9VmVXSnLa28F24WhEFAvnoRaEnOOrqQqe
	EPb9Ty27nzk+nfXHmjqhr4OMzWm2616yt8btSVsHtCZTV1tCoAC5HQHZatRzp/O8Q77u4B0SdLh
	ueHphLP77GyoeUk2ZKRUD9mGoMzJ7M/4sIa2rTk6nmIXppwvSBKicUPuBeig2D1F++NMpWrSIDc
	wPq0EM6o43P5rv0N8WSaOhRdtUXORyhwyNOgJNd424zmP1EymXLfpp+2peOIja9vx3mqmNffUCO
	vPDbcbVZ51PQHG+j8S12yriZS0EqsT8dJi4pqLId96jxsHSbkQ4j2z2s+65UFhYPipWpFOf9Gjs
	=
X-Received: by 2002:ac8:6109:0:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-52ff710cdc4mr3278821cf.14.1787950755287; Fri, 28 Aug 2026
 13:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-5-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-5-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 13:59:03 -0700
X-Gm-Features: AcwNN1WI_9DAW_34H7aprFGN9TAhxXzmVTrVu3YrXpEKWiXKUeYdo7vi9R_t0vg
Message-ID: <CAGtprH-Xi8-UGWTkVhNnd1dkmtcnFJsXOsTjr=ijK53aUuH4ng@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] x86/virt/tdx: Allocate refcounts for Dynamic
 PAMT memory
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
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The PAMT memory holds metadata for all possible TDX protected memory. Eac=
h
> physical address range is covered by PAMT entries at three levels (1GB,
> 2MB, 4KB). With Dynamic PAMT, the 4KB level of PAMT is allocated on
> demand. The kernel supplies the TDX module with page pairs to store the
> 4KB level entries, which cover 2MB of host physical memory. The kernel mu=
st
> provide this page pair before using pages from the range for TDX. If this
> is not done, SEAMCALLs that give the pages to be protected by the TDX
> module will fail.
>
> Allocate reference counters for every 2MB range to track TDX memory usage=
.
> This can be used to handle concurrent get/put callers, in order to
> accurately determine when the dynamic 4KB level of Dynamic PAMT needs to
> be allocated and when it can be freed.
>
> This allocation will currently consume 2MB for every 1TB of address
> space from 0 to max_pfn. The allocation size will depend on how the RAM i=
s
> physically laid out. In a worst case scenario where the entire 52 bit
> address space is covered this would be 8GB. Then the Dynamic PAMT refcoun=
t
> allocations could hypothetically cause the savings from Dynamic PAMT to g=
o
> negative on exotic platforms with sparse, small amounts of memory.
>
> Future changes could reduce this refcount overhead to be only allocating
> refcounts for physical ranges that contain memory that TDX can use.
> However, this is left for future work.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
