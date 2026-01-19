Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E051A275
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 04:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768798587; cv=none; b=uVEWZfonxwBSH53wqFcvtVkzXsVpI0K+kGcjUmeXRG2yF6QOu1F7MUM/v96XVvljCmbBKTaibea5+RcXTYR+wkWee0hse/gdKiv9FhXzM15UhPRC4hdVFlCLXMRlJKIwX4uTgwETkPnddglmlt5qC67vfXxg28e7VqE8k/EkC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768798587; c=relaxed/simple;
	bh=D9FWyj+k61WIbtwhhEs6+Q0lJ+rOUecHUxqQH9k8xSs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mYhOJy3M200iWhLX+lKb7oRv6hDhkJz9cHqzqGsShvqrUJLnRfJLg0apgQu/CeB1BiuAqURXYSBtx6ffBG7AfipFRJfa9BjgOnu7bOjjUzbQWIC162F8O1RC6zzCPVa6FiM9l9GoioG7Rwq+laQgS7ovzaUz7f1iL2FyERhBAVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=geOF6zEh; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="geOF6zEh"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60J4tSZK2714157
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 18 Jan 2026 20:55:29 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60J4tSZK2714157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768798530;
	bh=D9FWyj+k61WIbtwhhEs6+Q0lJ+rOUecHUxqQH9k8xSs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=geOF6zEh4xIcUImGEAKa9y2unjdXgoqnI0qZziGI0PFlOcSF/Mllvh+AAFmZeATkm
	 17HisQ7ZXNYyMKGIOg/49irBKZ9mpmi19PF7VBbqSR2GgDZk7zyH6jViqZbekGJrOa
	 3aYWqXhg508dqhNpz+ZilEdlMdL2k2AfSZk3yKB7qQTXNU/Dg7Yojo3lJMRWXOP9ME
	 v5r2qH4AsYMpllMfCQK8YslbgtBzSS7udum+EGeTqRQM2ZpOvjZY0AY/uos6PtDkAz
	 lV7BKMNaAWf2l/VaCirumzmVnY5GHwBq33NUQTsjGegZ1mmv0r1cYFgUqv8hVNYVMN
	 Bvzq74ZQoLKjQ==
Date: Sun, 18 Jan 2026 20:55:22 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xu Yilun <yilun.xu@linux.intel.com>, Chao Gao <chao.gao@intel.com>
CC: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
        reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com,
        dan.j.williams@intel.com, sagis@google.com, vannapurve@google.com,
        paulmck@kernel.org, nik.borisov@suse.com,
        Farrah Chen <farrah.chen@intel.com>,
        "Kirill A. Shutemov" <kas@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_16/21=5D_x86/virt/seamld?=
 =?US-ASCII?Q?r=3A_Handle_TDX_Module_update_failures?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aWiIFlbrGqBjpyvX@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com> <20251001025442.427697-17-chao.gao@intel.com> <aWiIFlbrGqBjpyvX@yilunxu-OptiPlex-7050>
Message-ID: <CB733CD0-C5B5-464C-AD75-DD5475BCF194@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 14, 2026 10:24:22 PM PST, Xu Yilun <yilun=2Exu@linux=2Eintel=2Ec=
om> wrote:
>On Tue, Sep 30, 2025 at 07:53:00PM -0700, Chao Gao wrote:
>> Failures encountered after a successful module shutdown are unrecoverab=
le,
>> e=2Eg=2E, there is no way to restore the old TDX Module=2E
>
>"e=2Eg=2E" is obscure=2E To me, the following sentence is explaining the
>reason why the failure is not recoverable=2E Maybe "i=2Ee=2E" or "because=
"?

"e=2Eg=2E" (for example) means the following list is non-exhaustive=2E
