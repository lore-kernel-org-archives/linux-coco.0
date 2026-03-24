Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B536680F
	for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357094; cv=none; b=EIh35X2GVJzGlTapqy2gugPUyEaklWlzbqS5XAeGWoRZk/ZXlNfESm335cQZuRpM4/alN8HOsjqM2vEjl168SuhLB8ttUJl4KMNUGBe+QVg7ttAo5pAbCYmA+jOSIG5ZFhUtG3gSEaGy3rSvBj9dE50CNM8MNapWkbGN/sOBW/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357094; c=relaxed/simple;
	bh=UekqH47k2cwGT4dCv4/f1JuxckWHtyDjuoLAl39hWmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjBri2DdC1xsRfEkFNLPz4MJGvbnfNt1mJA1qNPUYoeLQEYBICZ2CHjFjnNJyJWuv3g/mNizS/vwF/rxynF+dwdSvQ9oc8nUI/AlgqNQMUXyuSC81C28oaQlJYC1YpWMGTAerPMWBW4FIUktPyHueDaSHJ8ech3sLrix7plRgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=FhOFDzgm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="FhOFDzgm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so37158075e9.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Mar 2026 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1774357091; x=1774961891; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJ9KhFxElQQZSu9ghWXCoeiyYOoUrbSYY15jZoKWOCg=;
        b=FhOFDzgmTriFKA0UDhRdzgQIdYQ1x09nfY6kuXEJq1oxfoYlyf+QTlEdh3IjlTMoPQ
         wDWmCnHE1sgCRgakUJQTyNCEhZYiOM7jwbkTJb5vK5Lw+ceh0DXiS7ZAUj9dA++aJxUW
         K9oP+CZPiCipL8YDTdFlIauY4DJrMv5JhbjmnlYa3GK1NKML3j6qGNBz8JqQaiNBGXQB
         THWDFTTiIQG86Z4woMmntw0VzXpvfYyGQ2BKdDC73VPxxSnZfnNe/w45DUCNU0AGFx4s
         EC7eUBGHAcXd+SSpmxUgEp/DTgAyxyNBTU71rFii95W9YUeTU8yDK39NP29PoyxghfwB
         DPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357091; x=1774961891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ9KhFxElQQZSu9ghWXCoeiyYOoUrbSYY15jZoKWOCg=;
        b=pALu2Dg5RDxvyl+Lmsi8iwJSIuFJM2o1dosQ6rkGn3eZhNnzNJPr5KTJy4adKuJUVz
         sdC89COH0FD7xOMfTjRoDONf0ZbH3Hp0F4GWhpjrBs44TFd8yxEPuPS6kZn93jwi6ewF
         kmEhU2hSCzP4P3QV/yxLwuaB2TaLEVT8Vwgf6Q3uzNtqb6xYom6Mm+VRCcm5Oi/ZZQwo
         79WTbpdZCjhLSo/cxHJ+V/JDEVAXvsDnOHM75jHSIcG2jHFx0BtwRUgvOfFzUZReektL
         M1fFcicRAx+MNMcP2Np6DZaq0XnrEO6IrRhho765MJo+sKJrB5vlTW22wuRrt2Vlx/Qe
         5OKw==
X-Forwarded-Encrypted: i=1; AJvYcCUpPx7+t8RjJSKUCD7r7f3p8D6NB7o+baxVKHhSgOVxSztYwseCuB9zQqf74NLl6uNgLEsUEJqFSZpK@lists.linux.dev
X-Gm-Message-State: AOJu0YwEArzFBgSpH02Bf2ThT2wvshqzXNBkCkHrYF3ddiZ4r4S5NVOz
	RdOQRn+OP2yRom+d5+lD65qyqZHvid1iMnfWWX6LxEL5JRKNosiN7NcK4WL2SpxXIFU=
X-Gm-Gg: ATEYQzxxh3M5TO8Vtofbk5xc6zn4QhYVCmXRlI0S+jrQfDUeSc0yYDiw2Hqkba25boT
	DQM7X3vLFBVtJ8frFD3vaKtn4NqtVRXDCvX6qooO5z86BayjuT2ljGTECzpOHamZZoMnrLzVixJ
	VWJQwlLnA3CpNWEH5lxH8ei1ggMv5r166JFYhsx0LPkTMb6+RtS35vhXXJ1TVmIn6fY4bPZwQS4
	N0Rz/fkTaGXsiPD8OzmLp67XyowCl1L3jh86WyiJYY6bUcDPVWCpGh8bgxUjkDOazngZdLKiL1R
	u0q6wqHpip+6RsYVkFIZkmgyD1KzQVR4v93+I9xpTx1EtovsttfLPmlSjBkVYy67fuvw1hmccEJ
	FDfLo+38IpOCsolCuYec5vCxX0RdII7DfEMW4bYTl4owNQ8uUsixz6fYfpCunxKYhn56fyWclL2
	yBiLqdwvpghuLLxPWHsEckH3qWAd884SNyUSM=
X-Received: by 2002:a05:600c:3b07:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-486febb59acmr211442975e9.5.1774357091334;
        Tue, 24 Mar 2026 05:58:11 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871109e659sm17440195e9.23.2026.03.24.05.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:58:10 -0700 (PDT)
Date: Tue, 24 Mar 2026 13:58:07 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v4 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
Message-ID: <vflgbxlfg4pzj3yrnkz7g5dwncnod6uenwpwgs5z2qflbrjucv@coqj6fmjkyye>
References: <20260316125857.617836-1-jiri@resnulli.us>
 <20260316125857.617836-3-jiri@resnulli.us>
 <CABdmKX0Ux2HMTTuOnvZryBBRwCjH0zUe-EMvL9k1VxZtz+BWiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX0Ux2HMTTuOnvZryBBRwCjH0zUe-EMvL9k1VxZtz+BWiA@mail.gmail.com>

Tue, Mar 24, 2026 at 12:25:46AM +0100, tjmercier@google.com wrote:
>On Mon, Mar 16, 2026 at 5:59 AM Jiri Pirko <jiri@resnulli.us> wrote:

[..]


>> --- a/drivers/dma-buf/heaps/system_heap.c
>> +++ b/drivers/dma-buf/heaps/system_heap.c
>> @@ -10,17 +10,25 @@
>>   *     Andrew F. Davis <afd@ti.com>
>>   */
>>
>> +#include <linux/cc_platform.h>
>>  #include <linux/dma-buf.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/dma-heap.h>
>>  #include <linux/err.h>
>>  #include <linux/highmem.h>
>> +#include <linux/mem_encrypt.h>
>>  #include <linux/mm.h>
>> +#include <linux/set_memory.h>
>>  #include <linux/module.h>
>> +#include <linux/pgtable.h>
>>  #include <linux/scatterlist.h>
>>  #include <linux/slab.h>
>>  #include <linux/vmalloc.h>
>>
>> +struct system_heap_priv {
>> +       bool decrypted;
>> +};
>
>Hi Jiri,
>
>I wonder if it'd better to call this cc_decrypted (or I guess
>cc_shared based on Robin's comment in the previous patch) like the DMA
>attr? There's a separate effort for "restricted" heaps with TEE for
>(encrypted) video playback, which doesn't involve VMs or RDMA. I think
>the cc_ prefix might help avoid any confusion between the usecase here
>and restricted heaps.

Sure. I'll rename this.

Thanks!

[..]
