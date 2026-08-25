Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF2A3C3F4F
	for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650362; cv=pass; b=qg2Ll74OJpaPLeINVPbXUyCAlqbq2JJpYELK8XVCTuXMzcO4z+arHbzZg3LCOVHPKOgLqUrkS4tc0NuUOOlwQeX5uGx0e+SpBACIIpzbhUfe1TLaIr3/Bd4mKUBFuRAqgZe+s90qKSEp8m6RzMjtX8WqrZk92AzvR62sgBsCrNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650362; c=relaxed/simple;
	bh=JmR/CB4xNI+jcLTEmH96suuAwtFrH/css1uIDKyeEDE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dE6OEoVeqVWg4hHvr/3NvEgqfMr5kuenpF9rerPQ0p9mHkBcl5RjA+ycHSEP499OM5ghHTM+iCW1l5qK1Vo8QJtISFmASdNufC8xtDeOt/z1HF474djKWhZ+ZPTOyezPISveXP6ARBfjbVDqcksskgsEf72XEtd8ESgYkE+Fv90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wgP/b3UN; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wgP/b3UN"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c928bf172so33353921cf.3
        for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 02:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787650360; cv=none;
        d=google.com; s=arc-20260327;
        b=fS3UGaUC2ZXR7GhQl/ZWPsPzJyJWE/8PDdZbluyqenscy3Snuj6QWERJ7X6TQAJODW
         KAKS2NOxDS17UK9jejTOpU4lRrNKrqRWXsKRqYwsMM6mtHHNPVcjoXN1lScKA8e0AAJT
         FXO7SOcgApdYNNgWxP9I4FMFz4aVEvBa0O/siuKK2NjK4GUO/91avuJ4Yi0WcBKUaNFT
         fwk7hxdRthzqLYcUnnOmB5N4e9sDIkKb+7HY3Fs6A/+xL26qFPQQndZPQXwKvtbE0cKZ
         xu4TF5DGRjCTT0Ibdh3EL8KUd903f72UVD9O3RwyGqeMVVoqT3REoJ8z+KElL6C8T+d+
         03yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=uGYcelPQ9NcToBmCcA1Af+U2AVoIV7KPe08HWX7sjzg=;
        fh=sVpj8PJnOrT6W60LIm8PdDmWb22E4z+OTkWQrCIkEPI=;
        b=h9a7lHnv7h6JvVKES95DivvS3aIM2CotpYVHQH9b/jrvSvU3qJQjZejRExAMt/ukw2
         kJY74e2cyzYCAj37CEfzYeuLag3SBWLjOEguV7wcZPH/rbzZ18lAqsaouADYJeNo0rHo
         2lCUPtN3JMjBjtV91oJt8B90rGHMR+9YDY3/DeLneW2qA3GegjFxcyKiWLeJBAt+OUD6
         j4EWVVE2s+14gXD2M49St8i5FFpcQLJnz95aE4Ac0OZe7XTwXeKnwug3PBo0hHMo4q0i
         ut98gwroorqNPcmYn8dnTSQ4y5V45nbuZbHLK+71zRBIP/s9iQucVnH1IWdnJHqv7qx6
         cdHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787650360; x=1788255160; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGYcelPQ9NcToBmCcA1Af+U2AVoIV7KPe08HWX7sjzg=;
        b=wgP/b3UNRq8oUO/6/e6oUrK6HAVCJMcJUHPoerEgfI51x33brjh3vvOUGzuzQ05U7t
         lohneHovKqGmKa4bNDhyCVhuKVtBQMNZ7tLh8MAmbDJQq92lkvitgP/UV78rSUIYFscE
         wxXvTXkWVQ3yJ7o4itYxOp0TJoAcaXCQm2qm9ddYaCf9UCI9kUpl/IgrxjUcx/Fh1xBO
         A27YoCTnFlhg9O1VAqFy8FsE7BxGt7k/vYstiw3bwljqRWRZLqwCPgGHZ03ijLHRW2ig
         6w27q9Z1aZWsQc+1odjTkk4ifdp3bAFTHdoIaip4bk+QBi/mrDQvmhK5OUW0bTnAvXtX
         sU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650360; x=1788255160;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGYcelPQ9NcToBmCcA1Af+U2AVoIV7KPe08HWX7sjzg=;
        b=sPptFKJ2fz/GqPiYf0ux9XmpUhHdySQMgTsNeFe8iHNcXoVbBJ26ksTVbxbgrMVimj
         XdsevRyDhGmvlSJOPbL8gNp/inRSGIRBGxvDLTYyNtzM/f3yBictHJY1WgW9mLuADpe+
         rp/wziqso7sXkuImj55CiQ01/pVOzu4RXWpgQAY9zFS5TOuiE6Inm+FfJRQ3wxkY7fV2
         iDM457ut5TViMHPXtjyjkUWonTtStwK/tsYipyFPNMWLodALp33btgfkNFpebhxAuTVl
         9FOZfBNksRQ2l7j65JyavZGF9FWMtPmys6GFI3LSJzqK3K50zIVYtZc+n1oRwVLCIR4E
         7/3w==
X-Forwarded-Encrypted: i=1; AHgh+RoodqxYMiI3MQo83/S1+mXx75m3swNxiO4sGVn1dySVf+HHhd11rQt1Nj91Ev73E+jSNF0L41ASCcpH@lists.linux.dev
X-Gm-Message-State: AFuF++lhPAj9/6SR90OvUSKivnSpRDmYxtA5tafNSKxz/n36VG22aLlU
	OdWqGjTsED6E6W3LzkLvJnbleTrHvI5IQey/FtvD1uevKH6UAYoF5BuFvBbwRhuwZLKCIWdXCKj
	kZ70IsBs3/lx87S5/+7tAHta9a8QOGHJ9HbE7JAep
X-Gm-Gg: AR+sD133VeKyXvqtKiVhKGlVxv+QLI2E1RiGK3DmdreS0d0Su6gsj21gLBP5lrh9j5i
	bTVc228RvjRAoT99+zbxcH3riLHEfnfStzg/uL6Oaod0fWe+jwmPx/DS8hRAhQPAskhWhhuPa2o
	3w2i7uGI5c1HGt0NxyBvrgwuBPDItCGk/alVuRAx0SCTYdOfzgG0Yuh00Nh21xyGF6cZ13n2Rfk
	5elIFEsU6L9yITUUgR1v0CpIhpkiEKLd9tIz6vz/u8Jzpv4Xc/kvRlakeIpFSNjS6JiaHvKy/Bk
	/rzfG4gaIBub3wi1cInB+b14f2wmomazS5vbgxrTnnpU1XxnWPl3MoNtLoSWZZAtRajUfN2omFa
	wRrti1O2C5wXT+JCp7YKY2kfy37Z/DrI=
X-Received: by 2002:ac8:5a8f:0:b0:51c:1eef:4fb6 with SMTP id
 d75a77b69052e-52df572d04fmr316920051cf.10.1787650359267; Tue, 25 Aug 2026
 02:32:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 02:32:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 02:32:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aohEz_1JFVDtlSnE@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-40-2fc18ee6d3ba@google.com>
 <fe1c6359-7371-4ccd-9807-1d81c160d12b@intel.com> <aohEz_1JFVDtlSnE@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 02:32:38 -0700
X-Gm-Features: AcwNN1WsNauanv_gwVuUewgYIPtJyz0xA7nijfgKendDL3I7JaxAnreMY2X_gzc
Message-ID: <CAEvNRgF8XE2Xsn-g3qzPxcdfLdvJEc1FZw9LQ+deeXsFpdZsOg@mail.gmail.com>
Subject: Re: [PATCH v10 40/41] KVM: selftests: Update private_mem_conversions_test
 to mmap() guest_memfd
To: Sean Christopherson <seanjc@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Aug 21, 2026, Xiaoyao Li wrote:
>> On 8/8/2026 5:53 AM, Ackerley Tng via B4 Relay wrote:
>> > From: Ackerley Tng<ackerleytng@google.com>
>> >
>> > Update the private memory conversions selftest to also test conversions
>> > that are done "in-place" via per-guest_memfd memory attributes. In-place
>> > conversions require the host to be able to mmap() the guest_memfd so that
>> > the host and guest can share the same backing physical memory.
>> >
>> > This includes several updates, that are conditioned on the system
>> > supporting per-guest_memfd attributes (kvm_has_gmem_attributes):
>> >
>> > 1. Set up guest_memfd requesting MMAP and INIT_SHARED.
>>
>> If I understand correctly, even with in-place gmem, the model that shared
>> memory comes from the userspace_addr and private memory comes from gmem can
>> still work without passing GUEST_MEMFD_FLAG_MMAP flag.
>>
>> Since this model is not prohibited by KVM. I think we should keep the
>> testcase for this model to ensure test coverage?
>
> +1.  Deprecated doesn't mean unsupported.

The original test case was for non-in-place conversion, which wasn't
removed, it still passes.

Is the ask to also test, under kvm_has_gmem_attributes aka
gmem_in_place_conversion, to have guest_memfd used as purely for private
memory and have shared memory taken from somewhere else completely?

I can rephrase the changelog and change the code to clarify that this
patch is meant to specifically test in-place conversion with MMAP, the
intended usage of in-place conversions.

The ask to test gmem for private and something else for shared seems
like a different test that can be added separately, perhaps in a
follow-up series?
