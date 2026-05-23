Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28829823DD
	for <linux-coco@lists.linux.dev>; Sat, 23 May 2026 00:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779496842; cv=pass; b=tbW5m7xgssK6oi5O4E5E6DsVX3JR9rA8jtVmmLbYSQAVL/hHQ8xozbUF2hcAcMQeEkJw3LWQytr5Fx+TeHzSjCLlls6aNOwF1xQDLISobxLLeQn7n/ikDg/H5z2Yqtp0Z7p5FX+Yd7KCSFkqZfg+37PrnAA5dy+rBj7sz1nAKoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779496842; c=relaxed/simple;
	bh=DzImTxEIdLT7uoHzI85KHDAQ5RrAcxR1yc9QoxOoDBU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FX77ExiuuxfOZZQKfyAe/qhLPTT9nN01I/89KNtQ8XOR/v/+QCCMtrbzchJJ5H5NY4Ts3fFP9eBxGCRem5Xrh2LutvHwaYBM8+xSMURWyaUW+J7AAGrbRzeRdWJfIiU89PpxYReEz1VrpgpzXUt/G+/BT5VXHyqTtFItqKM3kyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+GRNA7K; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+GRNA7K"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bdbac72ac1fso493041066b.3
        for <linux-coco@lists.linux.dev>; Fri, 22 May 2026 17:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779496838; cv=none;
        d=google.com; s=arc-20240605;
        b=J9m3fGfyrgvbzPTK/dP3lGKqDPW/2v2CGc0K8KlpXMq16BMgkHBs8l2aNy0wKDU/fR
         fGrzD5jM4UCJwnBbBaINHUYUJ/jnhN4H3+kvWla0lW0l+hla/jRxObIa2ht67fGfEkI1
         40bsufzZaufjFOOgM3NxeBAL3fP9B/iguXiIh/dy/0M0cH273T5f3qexA9Ec1zGO7GiJ
         WAsJX2ce9DeA1mbg1rnUb5kAS3KNxH6QFAzCQNDl6zeEeyjfrdhRjdiU2VMx+40N2+uG
         ljx/fEmX0s1/yAhlQpqKq7qCYU2WL2N6XiKxYZ9nGCveJ7T+on87fJ6K6/jFL1O0OVoz
         PJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=DzImTxEIdLT7uoHzI85KHDAQ5RrAcxR1yc9QoxOoDBU=;
        fh=mnQPMiGnLqhZu1oOtRHpeLFNIuyMQ758ELbHS3+Qip4=;
        b=CnImRVDyh30NzsmIXeI8o9vUFhWiMm4jLoP7aEcYFukQqzMZO5072jLrcJkW3UeFYB
         dtUI0PWhKz/Bh1HXfZVpuE0iTIf8V7fCT0nq+cGBIXgfLqNXOoRLhjdlPfRmo0cHnA2Q
         M8C7PRTmwBjngIENi7UkbLBia9tmAjX7Ul1YCP0UNaUDlIn7DGwsdnjAgU1xg1lS6kO8
         FhXXBRd4NDAnII6aejiTJj2TLRI5U0PXMfagiNYgwtwsPCKgvkfJ5OsKnmGLGRtf90Ax
         PJVPYCWJ8Ek9cLEgmlR8u/UslEHsS14SZL0oZjOpKiMtIf6cEAipWL4LcxE64lfjaqxv
         YuxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779496837; x=1780101637; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzImTxEIdLT7uoHzI85KHDAQ5RrAcxR1yc9QoxOoDBU=;
        b=X+GRNA7KjmEBmt6wxjffdZBgs5mYDBaQNN5vPOJNC3buVOdDUev59HqIeGhtD7keF9
         eKpRwe4htQ1TZ0yWJZYghXKPQjgzatVcKIzFJix4tIj7wu7BoLTrjfyaT6unAE5SJANS
         bChsX8BsniZVgWfZGOFy+4HKDp6NlSxJXf9Xc3kKdrVTvrFek8MxgXEgzUEzT3s96QGH
         Sy96ShWy2kTMx8oUeCxpT8xEDJnTGejn5UPv4rYB/3gZoXxS82F3+VrSQVUURLWZ4J+O
         zRLSxJ8CQBdbcv8XXHrv+pdzqVmdNkMtrZK2WQjXD1QOuJz35PSBXYk59YkHdx8EIJbE
         dq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779496838; x=1780101638;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzImTxEIdLT7uoHzI85KHDAQ5RrAcxR1yc9QoxOoDBU=;
        b=J7uAFZmGk8n2vT/eq2i+5M+rZLFZ73G/c7WXDr+KZ5GF5R1NfhuZaYP1sLitbctsBm
         /HhhKhzyd3LrtyZYniqIsk0KPN5L9FsEbmMJigUL3Vw1nx6XyGqqcLf5ky0qnpgEviL1
         WuT5NgVTos6Sr0oLviBDvOA8STzuA40Q93cM5cU4aYYlG68vavew9IPbFbb4sX26UWb1
         diSH4yn0GTgZYxPSAsb7Jwh+sojNXpZaHswamsf5iTJ5qkCH3GOWaje31gglGHl1T06S
         gaYBQL07fW1juoopWfstv8mk3iTgDWhu1BkNQrjxC+FWfoLEOuvBRyQh2Gvc5DZm9wUQ
         HfQg==
X-Forwarded-Encrypted: i=1; AFNElJ8dEjlPoJGltLtTVarTtzHJ2Pam4NJbDbSJMCpH8nRdSqn8l+C0wI59uxYF0Iy+QijwmNNEO/WAfd41@lists.linux.dev
X-Gm-Message-State: AOJu0YwtOyROtlgqCjo7yAProhe8KUkTfPAms3lH+ickrzWsB5CfCett
	Updwc09uDXnqsVb0NqWfmw/AjMxkhzfJfSNsmqb4dfwQPABe+7Qdz9raPqHmIdHjbHlG8yRlDMc
	vKLqKm9pz6XKnFhLvDEYA6jExjL9+ap8=
X-Gm-Gg: Acq92OE/BXRbSzD2SS7hDabIinR/xyvBN7ln10Zz19MK8Z4m1lCo+J3n0UA1teoLGRf
	tbspI5xKanzYw1ft4yrE0lqTRD7NJdfQKns4JYPW80a5FJ8wFpX8gnIzvkkTMum9mnzuYMN/WL4
	ZvT1FwFGF6egztYEhmxEq8rqjBoQDJ8X8rVjWxMnPkmIiQly8LS8MfO+5xDpNk6QPZ7OW1cLT8j
	T/fOhOQP71iHjMohLhk4AE37Z7Uuw4zJPnLvYV9+7gZlV6azzr6zn6bAJhe/87yOblHYArC93Ah
	BrgSd770P9JidpOY+jUFJWSOvRU0Ii9XbKnpOZSwqpGzE4Gcgg==
X-Received: by 2002:a17:907:1dec:b0:bdc:fafe:bf66 with SMTP id
 a640c23a62f3a-bdd263c9230mr293031666b.33.1779496837246; Fri, 22 May 2026
 17:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Fri, 22 May 2026 17:40:25 -0700
X-Gm-Features: AVHnY4KUuDYdbAhs4DxPRoruchoX4HF4FN4Q5Flh4ze1fOCs2dB2rccyA0BbHhQ
Message-ID: <CAKSQd8WP4sue4Pzf3yK67iMUkPth2xG1CrpUko__JF80i39=ZQ@mail.gmail.com>
Subject: Re: [PATCH] x86/tdx: Fix zero-extension for CPUID emulation
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "clopez@suse.de" <clopez@suse.de>, 
	"x86@kernel.org" <x86@kernel.org>, "ak@linux.intel.com" <ak@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 12, 2026 at 03:14:54PM -0700, Dave Hansen wrote:
> CPUID (the instruction) is defined to fill in eax/ebx/ecx/edx.

In the original x64 spec CPUID inherited 32-bit op size from
the pre-x64 days, and although established leaves might all
have followed that definition, the ISA per se doesn't prohibit
an implementation that allows, or defaults to, 64-bit op size.

Having made that statement... the same does go for MSRs.

> Those are 32-bit registers so the normal register rules apply:
> "32-bit operands generate a 32-bit result, zero-extended to a
> 64-bit result in the destination general-purpose register."

...in PM64 ...while outside PM64 and across mode switches
the upper 32 bits are explicitly undefined. Needless to say...
SMM and then VMX and SVM had to violate that to function.

> So a properly-behaving CPUID implementation will always end
> up with the top 32 bits empty on the four CPUID registers after
> a CPUID is executed.

True for a "32-bit op size" implementation. Maybe insert that.

--
C.
