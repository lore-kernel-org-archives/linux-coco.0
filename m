Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368899;
	b=k4CQNmlIuqJDzy06LFqwPuKuXlvQSnqECJ/0siaQqmLNkoRFNCyqr1eEeVnthCianaS+
	 41P0fw9njznhhgwwIEsJfWada091WZvX7Ky87TA/h892YLmUQWAC4QYF+f6b794m0MKbG
	 vsItkxZX8oIKIHiiEW71vkMJfw7Zp+XgqGipkYAWQCg+so8D5ETQhAGVpwlSAIqUXt5M1
	 Mdccx1CnAs81kuKWFy7hdIio5rMKZTX4vseQXVJTKQSN8XGD0/eO/s8FUz3SYhAwOEejz
	 Tq1T9DYoKyosLLRqP8sxkN3IF0cUJ6gKRLfTM+Q4Ag7ZxFtX+DCsh6LEho/ap55Iw5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VIxu9J0Ou0VxsHPF6RPn2lCybCMRa3vaXu29ngS0ZFA=;
	b=ghTcoSjlwA2NvQxfa0ii6y7jGUGIAfktE0BbtZzcAxCL9ZMT8BjYXapLv7FfaarEWFRk
	 psNvlKJhXz4HCiPZKIX+4BECMgaudydBghECxrD4Sw4H+OGGTYNALodsPsWofdM1eG2Ya
	 rFqUSpq2AOU24V4P/5OerLfa6QHg7M+h3zGvNKyTX4M341Bz+MiN0RPEqP5mqZPfmE+9s
	 HzhkrAQSk+VndW8jFdI2eeNWKUfTywt/eaTxsoPlPbwakyv2iOKicl2c/8i4MlM1nA2WM
	 RJJElrC1gHJtWHZtLzO8fIgbDIL3ALWj/6gEsRtcG/k8J5KMpwxIF4Ehecdcuw5V3dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=VK3Nij67;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754A7606A31E
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 14:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=VK3Nij67
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1000772a12.2
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793368897; x=1793973697; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIxu9J0Ou0VxsHPF6RPn2lCybCMRa3vaXu29ngS0ZFA=;
        b=VK3Nij67sk2576WdiqkapkFxPLoMAm4S7CpCX6rOnTOvs4rYUagU1YHFm6d92Z1aGy
         meguJ29334j9Rd9YOGPEonYq+AOYud4F9TmGThiUHsvkLcohq14JwKgr7mpOVrzpXvLx
         P8WcmOwVmIugNORCDTnKDM8+6dn97/Ck9u9m00tKYB8TwA+7+Ks9eLpOdTZ3EaSgXRog
         9I/x4PhQLhHvrGYzVhSHwkdzWx4r+oD5JPFgZ4hSFc3/B6kklY/0mm8MKNKqUEhD/AGd
         a+X1G8N2nSa9uqJ+ybGpLzdPphm3gTaqXueUCtCQPkPJw6pnEbkfSOX7ZWtZ6ksh/vqF
         y/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368897; x=1793973697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIxu9J0Ou0VxsHPF6RPn2lCybCMRa3vaXu29ngS0ZFA=;
        b=zqnCnuPfUeNdGhhokH2077UzZ62pafYezVyANVJyb1eFttirWpSgAsDnEtPYHCK9Jv
         5qKFks+43eCevcX5476z3IQQmNvOCbSQbKENq+pl9TLooF4mZ7exfpVUS6c1/TomDeZT
         eS4YocHHYYmCWvgjED1B/GNrmEBbqNzZ5CzkHoSlabYGxtfHTOleUXlrMVIBME4liHc3
         qA3G6AGyNYxwq5+3LUfhCRlf2/aFNa6AOc0Bmnj/tW95yvPrXeJfW44er0QfmhfTXP5h
         hcqGMSb0WW1WUOk8v4gv2j5Xa8CyaOBkd80CK7gQWeI/BQn++Auh++lN/QZNd3YWRjTS
         x9GQ==
X-Gm-Message-State: AFq9FYLjxo831Iz0h42COI9oPYxf8vyKTM2ITpqKuYw5LN/dQ+Fmzt+m
	t+Y8IcqTw9U7RINTXUkJ9UTssQvihKc2BG30hZMoc4GaFhllcMy2lij45yEykGmXwuo=
X-Gm-Gg: AYBFou2/sRfl3ERiiXaifJmJaxnH1eOdFEd8/xJrvTsYbZRlmA08kz1K5AwP8ZA2eHy
	smaeXB6a6O/BvqrMOHh4282fUsPR1ltlu7KkOaQFq4xpvXoDnY5BGE6F7Acdw7oSGS5B075DmFv
	pdq94GlSjc88QSmcFsq4kFWyoD1VMKES7B5pPDnih9iPBWjyU5RVX316Eb+K45JM4PLR/2SL/YQ
	9eAnLrnyh8+Q8mYb7IA+rqOfcCNitB8OVHGI4is828J4NnvNWlXiEjf4GwHYEFDp0pMo3/0ZQyM
	GFjSphejcVZSKcw2KyDqxs2bAVWMyZmW8qIUD5HEHYFNRB8yhZJXmdg1r1EvQyrgp9iNDJGq7Xp
	OBDArd19T+GvYLc8pd4vPFObJQKkhGWRj1EMovTjSEJ68hZb2h7ZB+i50o8MXbFJvOM0yoOTEix
	cldfov7dBKCBTXfEawY4ajh9YW8a97r22jrLt2mItIhT/0Olf9e1K8MMsOTKAMfZHdSDV7x/RnK
	zVA9uICfMDtRT8neT1UDSfTi3wV/hqMA9goiYSkTQjsaBIm6pG9okGiFGTsFH8BuDPRQU6/Niqn
	JAi55CT8D064yq8wc+X1tkF8N4rKBwJ4C+pDww==
X-Received: by 2002:a05:6402:6c3:b0:6b4:203:a182 with SMTP id 4fb4d7f45d1cf-6b4d337b289mr1379091a12.3.1793368896453;
        Fri, 30 Oct 2026 07:01:36 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b4d4d3sm609308a12.36.2026.10.30.07.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:01:35 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:01:29 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev, Dan Williams <djbw@kernel.org>
Subject: Re: [RFC PATCH v1 06/11] PCI/TSM: Describe the PCI attestation
 control family
Message-ID: <auShvL2m00S70H3d@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-7-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261028152618.1356860-7-aneesh.kumar@kernel.org>

Wed, Oct 28, 2026 at 04:26:13PM +0100, aneesh.kumar@kernel.org wrote:


[..]


>diff --git a/Documentation/ctlv/specs/ctlv-attestation-pci.yaml b/Documentation/ctlv/specs/ctlv-attestation-pci.yaml
>new file mode 100644
>index 000000000000..edb35cede0c2
>--- /dev/null
>+++ b/Documentation/ctlv/specs/ctlv-attestation-pci.yaml
>@@ -0,0 +1,79 @@
>+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>+%YAML 1.2
>+---
>+family:
>+  name: ctlv-attestation-pci
>+  inherits: ctlv-attestation
>+  pre-init: true
>+
>+attr-groups:
>+  - name: pci
>+    attrs:
>+      - name: name
>+        type: string
>+        min-length: 1
>+        max-length: 31
>+      - name: generation
>+        type: uint
>+        max: 4294967295
>+      - name: tsm-id
>+        type: uint
>+        max: 2147483647
>+      - name: connected
>+        type: uint
>+        max: 1
>+      - name: locked
>+        type: uint
>+        max: 1
>+      - name: accepted
>+        type: uint
>+        max: 1
>+      - name: dsm
>+        type: string
>+        min-length: 1
>+        max-length: 31
>+
>+      - name: object
>+        enum: evidence-blob-class
>+      - name: challenge
>+        type: binary
>+        min-length: 32
>+        max-length: 32
>+
>+attr-sets:
>+  - name: device-info
>+    attrs: pci.name
>+  - name: change-reply
>+    attrs: pci.generation
>+  - name: state-reply
>+    attrs:
>+      - pci.generation
>+      - pci.connected
>+      - pci.locked
>+      - pci.accepted
>+    optional-attrs:
>+      - pci.tsm-id
>+      - pci.dsm
>+
>+  - name: refresh-request
>+    attrs:
>+      - pci.generation
>+      - pci.object
>+    optional-attrs:
>+      - pci.challenge
>+
>+ops:
>+  - name: state-get
>+    type: action
>+    fd-access: read
>+    reply:
>+      attrs: state-reply
>+  - name: evidence-refresh

I'm missing why exactly you need this op. Can't you do whatever is
needed in the provider evidence_get implementation? Why it needs to be 2
step.

Also, why do you think this is provider-specific op?



>+    type: action
>+    fd-access: read-write
>+    availability: dynamic
>+    optional: true
>+    request:
>+      attrs: refresh-request
>+    reply:
>+      attrs: change-reply


This differs from what I had in mind: a transport-neutral
ctlv-attestation-spdm family with SPDM_GET and SPDM_AUTHENTICATE.

SPDM_GET would report discovery BaseHash, discovered slots and their
certificate digests, authentication state, and the effective
authentication slot. SPDM_AUTHENTICATE would take device-generation and
the selected slot. EVIDENCE_GET would retrieve CERT_CHAIN with
blob-instance=slot without selecting the authentication slot.

That discovery view is not present in the posted schema; STATE_GET does
not provide it.

Would this split work here? It would also allow non-PCI SPDM adapters to
share the contract. I understand that multi-slot discovery is deferred,
but a slot-zero implementation could still use this family and operation
layout.

[..]
