Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646873;
	b=M17kDkAXfPGA/sgHV0l6p6DZNs0dvSz5ScjrKMDAlpnoeU5x288EVeymbIEA+iYhg781
	 pJv1tqoCvVpdwvHnJsJTUNfvtwh4QNwhfZ0AUfz6moI0JF6F1g/+RwzrH6saCY0Vqt+2U
	 WLV7E+bvGgmAg6hQOaVQZO7RgIUEZ5egFhQ9BngMPgHXi+t8UTbiaQAtJsxb03IRJrFHo
	 c5Kf+Nzjbw6RVl5ueltaxPIZJhw7EIMCs8uVxXTreiXs3VXAwlFvTCkzSxuK+bD6mC7+l
	 iNcfr9Crl0TvB81OpBJKXgsu3R+umLY5fZffqdldtUXisVDZKz23J6hPuVmGmdtI4rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=f/8JsTWJfPX9TqH25ivWK4glEwM0abcyTEJa6hCd5AM=;
	b=hAoCjRBTSB2UDhj4xz0qVTcoq1t/Yy3t6ii5pH4ODpXI44WQlaljcvIH7CgH8ox6ltiu
	 tRFzOYNbhkY9na8orS6NJKph/knbdhAvcbEgioC8HhnDnlzlsqQfE8bxyX3madSntnZB/
	 Mr9VdLDyPhnfRr6xr2Q7QbBBmLjCyCXraH6N12JfkgtyR5c3XfViSoAEWHUpR717GOBIy
	 H9bIRB68CyTPIj8BQlaQ9iQyK6t/cQOJFLUhH4wypcs7neowSdpAdGa4PAHOFWNvE9Xdr
	 TS110dPpA34OCb8QgiQJ1GTx5IWYuK0J5h1hqRB4HshWwAzGdINr8xNNQ9/cItRIQoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=t4YhYIRD;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D6606A324
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 19:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7D6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=t4YhYIRD
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2727153f8f.0
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 11:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793646870; x=1794251670; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/8JsTWJfPX9TqH25ivWK4glEwM0abcyTEJa6hCd5AM=;
        b=t4YhYIRDB4p0gZDDLuVMHjuWo26V5a6vZ6lMU6GkAgEoThHcSf7duTimZG+sbijLzc
         Bg5O2uFMI3UKa00VeKDZViy43/GHP+u3TfrjMJLhQw9bB/D1Q/TVzTo8aGQCkW8xMl9j
         0CHQDyeDyWC9ZcV3CN9/nb6Tgtr1sHWRZWJvMfEYGrVV+2yZsoqAUIR6iALG9PDcPZVx
         X9hvENCmLxRwx7nJIG22ZB5ssRG1Nsk2Qg4QGdVsyEh5UiS8ZaTMrEep0j6eVsnwVBBt
         2g9m01r/WmrOLmNVKirJ+h1SdGaKa/iAgR0hGcKDR4auRahSQaeynMDuLZ4t8YxwL3xx
         39fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646870; x=1794251670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/8JsTWJfPX9TqH25ivWK4glEwM0abcyTEJa6hCd5AM=;
        b=bJ+O/JSOqXhknT5SzjYEfZ0jrzBFgwEUhwGzSN7utB2XMROSH1IWYGPgmPE8uFiScg
         NtF4YR0JUWvw2kTEJiPJYm67REcljHUncQbc8aXNt+ok/C9UGpzEKz6a84SKrsQsJKH6
         K7Kcau0voIFhArrPRY2U1BKiXWFkNvdcensc4OYbUey6jS5rJajq/0VttEqY2PV61MmO
         zU5R/rxBQjW3D+sGhBG1r4fvkuUaGLB24e5pmtpjq2/cmJbnEyM6nE3CJJPwuuighnn2
         EAtqjj9Gd0X4NXUU1GstRIHZ9bCOywjMfhAF5FGM+wWKvOP6oYg0FYpf4y9caWPRoYci
         3YeQ==
X-Gm-Message-State: APuU4Z/eW+gktJeSHrJVY6cFNoz/UMniU22ZdzTpdqio3gUWQHwfadTn
	jq1j8rzW0cw75ThTal0yH2QOuPs7l9ktfoYiVZpV9hY5Nir8zHSrcv+Uh9am/i8FRdI=
X-Gm-Gg: AYBFou2jo+EzkWI/Z8gdHzkQNB231BMUtHwtR3RGtt3xfjvFL06dhX3dRV6zRMQiCCD
	QGKe93oJ8QcOh5tpaEr4Mfg8cnBlWAUscuRZ/Q8rSUn3kucIaRg6fRoma6Kw4RgOgM9hfbl1MuR
	3E3Lu2VLyC14OgP7Fj/AM1sZp7fhmQ4USQ0jEtrKAlOB1FKAwYsPOeRSAZSnv9UW/UmFyZA6+BB
	YPXa+YhAac+CAAWp/TFKJjENfUlNU5n8pgoPEq1ujN4v4VD3FtPX5Onp1v6pQQunVGDOUc4F5Z7
	9fdfcAykExcYZQozzoU4H7BuP2vv7QUqhPGUn6shlvvEq/n5Xvu/eP64iea2YSmWB6W9u5tvodP
	YmmwX9rx86Z2TmdcneVH1xwqM7wEcUKbEzOCx9RzXQ5ZRKXzy5/aNURlv1q504tBjAQea2xtoFz
	T5oabVNyNb0A99z0oIrHKy/f0+dStw9SWz/2ilwCNrxkUQStzLgEknGwNIcXhCJFdO3OuAdm4Y4
	ey2gB7VSx/Frsbn8JDVLgc7gMRgrl4xMFK4fXefeXr4J17GJ0Awwij7qZ2kK908BB6OpIkTgsUm
	Gl1RJGU5+VkfYSP4NSQy0Zq2RY3vJ5MiV/Xi2sgL
X-Received: by 2002:a05:6000:719:b0:48d:fbf4:895d with SMTP id ffacd0b85a97d-48e6e2e7552mr24042751f8f.19.1793646869833;
        Mon, 02 Nov 2026 11:14:29 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm24075066f8f.6.2026.11.02.11.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:29 -0800 (PST)
Date: Mon, 2 Nov 2026 20:14:25 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
Subject: Re: [RFC PATCH v1 02/11] attestation: Filter evidence objects per
 instance
Message-ID: <aujfoITbvtx-TY8Z@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-3-aneesh.kumar@kernel.org>
 <auSe3YzgKX-lu27G@FV6GYCPJ69>
 <yq5aecd69ykw.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aecd69ykw.fsf@kernel.org>

Sat, Oct 31, 2026 at 07:24:47AM +0100, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Wed, Oct 28, 2026 at 04:26:09PM +0100, aneesh.kumar@kernel.org wrote:
>>>Allow an attestation instance to expose only the evidence objects its
>>>device supports. Add an optional evidence_object_supported() callback
>>>and use it both when building DEVICE_GET capabilities and when checking
>>>EVIDENCE_GET requests.
>>>
>>>The following PCI/TSM patch uses one attestation implementation for
>>>devices that support different evidence objects. Its list includes
>>>certificate slots 0-7, SPDM VCA, measurements, and a TDISP interface
>>>report. Each device must expose only the objects it supports, for
>>>example:
>>>
>>>  Instance                  Supported evidence objects
>>>  ------------------------  ------------------------------------------
>>>  Host link using slot zero Certificate slot 0
>>>  CCA guest device          Certificate slot 0, VCA, measurements,
>>>                            TDISP interface report
>>>  Host PF0 after discovery  Certificate slots reported populated by SPDM
>>>
>>>PCI/TSM checks the TSM driver's evidence_types bitmap or, after SPDM
>>>discovery on a host PF0, the populated-slot bitmap. The preceding patch
>>>controls whether EVIDENCE_GET is enabled; this patch controls which
>>>objects that operation can retrieve.
>>
>> For SPDM slots, I think it would make sense to distinguish supported
>> slot addresses from discovered population. DEVICE_GET describes fixed
>> object tuples, formats and limits; SPDM_GET reports the populated
>> slots and their certificate digests. An empty supported slot
>> returns -ENOENT.
>>
>> Fixed differences between backend instances can be selected before
>> publication. Please do not make the capability set follow a
>> populated-slot bitmap that can change during the instance lifetime.
>>
>> [..]
>
>
>We still need to filter objects such as measurements and the interface
>report based on the backend instance. Are you suggesting that we do this
>in attestation_evidence_object_find()? 
>
>supported = attestation_evidence_object_find(att, blob_class, has_instance,
>					     instance, format);
>if (!supported || !attestation_representation_in(supported, representation)) {
>	kfree(objects);
>	return -EOPNOTSUPP;
>}
>
>So the backend will have some way to indicate which objects it supports,
>such as the TSM driver's evidence_types bitmap, with the host setting it
>to indicate support for only CERT_CHAIN[0-7]?

Yes, that is what I meant. DEVICE_GET and
attestation_evidence_object_find() should apply the same per-instance
support filter. Using the TSM driver's evidence_types bitmap to select
the provider's supported-object descriptions is fine.

That handles backend differences such as support for measurements and
the interface report. For a host backend supporting all eight slot
addresses, the supported set can contain CERT_CHAIN[0-7].

My concern was only using the populated-slot bitmap for this filtering.
The supported set should be fixed before publication; current slot
population is separate state reported by SPDM_GET.

A request for an unsupported object returns -EOPNOTSUPP. A request for
a supported certificate slot that is currently empty returns -ENOENT.
